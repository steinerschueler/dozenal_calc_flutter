#!/usr/bin/env python3
"""Run the Dart analyzer and fail on findings that must not pass (CC-41).

Errors fail everywhere. Warnings and lint findings fail only in Dart files changed
since the base commit, because the existing code is cleaned up file by file.
"""

import argparse
import io
import shutil
import subprocess
import sys
from pathlib import Path

DEFAULT_BASE_BRANCH = "origin/master"
BLOCKING_EVERYWHERE = {"ERROR"}
ANALYZER_EXIT_CODES_WITH_RESULT = {0, 1, 2, 3}
MACHINE_FIELD_COUNT = 8
BULK_CLEANUP_TRAILER = "Lint-Bulk:"


class DartNotFoundError(Exception):
    """The Dart launcher is not on the program search path."""


def dart_launcher() -> str:
    """Return the full path of the Dart launcher.

    On Windows the launcher is dart.bat, which subprocess cannot start by the bare
    name "dart". shutil.which also applies the Windows file extensions.
    """
    launcher = shutil.which("dart")
    if launcher is None:
        raise DartNotFoundError("dart nicht gefunden: Flutter-SDK im PATH eintragen")
    return launcher


def git_output(*arguments: str) -> str:
    """Return stdout of a git command."""
    command = ["git", *arguments]
    return subprocess.run(command, capture_output=True, text=True, check=True).stdout  # noqa: S603


def changed_dart_files(base: str | None) -> set[Path]:
    """Return absolute paths of Dart files changed since the base.

    Commits marked as bulk cleanup do not count: They touch many files without
    reviewing them, so their old findings stay for the next real change (CC-41).
    """
    base_commit = base or git_output("merge-base", DEFAULT_BASE_BRANCH, "HEAD").strip()
    commits = git_output(
        "rev-list",
        "--no-merges",
        "--invert-grep",
        f"--grep=^{BULK_CLEANUP_TRAILER}",
        f"{base_commit}..HEAD",
    ).split()
    names = git_output(
        "diff", "--name-only", "--diff-filter=d", "HEAD", "--", "*.dart"
    ).split("\n")
    for commit in commits:
        names += git_output(
            "diff-tree",
            "--no-commit-id",
            "--name-only",
            "-r",
            "--diff-filter=d",
            commit,
            "--",
            "*.dart",
        ).split("\n")
    return {Path(name).resolve() for name in names if name and Path(name).exists()}


def blocking_findings(machine_output: str, changed_files: set[Path]) -> list[str]:
    """Return one readable line per finding that must fail the check."""
    findings = []
    for line in machine_output.splitlines():
        fields = line.split("|", MACHINE_FIELD_COUNT - 1)
        if len(fields) != MACHINE_FIELD_COUNT:
            continue
        severity, _, code, file_name, line_number, _, _, message = fields
        if (
            severity in BLOCKING_EVERYWHERE
            or Path(file_name).resolve() in changed_files
        ):
            findings.append(f"{severity} {file_name}:{line_number} {code}: {message}")
    return findings


def write_output_as_utf8() -> None:
    """Keep findings printable where the default output encoding is narrower."""
    for stream in (sys.stdout, sys.stderr):
        if isinstance(stream, io.TextIOWrapper):
            stream.reconfigure(encoding="utf-8")


def main() -> int:
    write_output_as_utf8()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--base", help="Vergleichs-Commit, sonst die Abzweigung von origin/master"
    )
    parser.add_argument(
        "files", nargs="*", help="von pre-commit übergeben und nicht verwendet"
    )
    arguments = parser.parse_args()

    try:
        launcher = dart_launcher()
    except DartNotFoundError as error:
        print(error, file=sys.stderr)
        return 1
    analyzer = subprocess.run(  # noqa: S603
        [launcher, "analyze", "--format=machine"],
        capture_output=True,
        encoding="utf-8",
        check=False,
    )
    if analyzer.returncode not in ANALYZER_EXIT_CODES_WITH_RESULT:
        print(analyzer.stderr or analyzer.stdout, file=sys.stderr)
        return 1
    findings = blocking_findings(
        analyzer.stdout + analyzer.stderr, changed_dart_files(arguments.base)
    )
    for finding in findings:
        print(finding)
    print(f"{len(findings)} blockierende Befunde")
    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
