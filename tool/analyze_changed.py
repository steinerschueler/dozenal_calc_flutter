#!/usr/bin/env python3
"""Run the Dart analyzer and fail on findings that must not pass (CC-41).

Errors fail everywhere. Warnings and lint findings fail only in Dart files changed
since the base commit, because the existing code is cleaned up file by file.
"""

import argparse
import subprocess
import sys
from pathlib import Path

DEFAULT_BASE_BRANCH = "origin/master"
BLOCKING_EVERYWHERE = {"ERROR"}
ANALYZER_EXIT_CODES_WITH_RESULT = {0, 1, 2, 3}
MACHINE_FIELD_COUNT = 8


def git_output(*arguments: str) -> str:
    """Return stdout of a git command."""
    command = ["git", *arguments]
    return subprocess.run(command, capture_output=True, text=True, check=True).stdout  # noqa: S603


def changed_dart_files(base: str | None) -> set[Path]:
    """Return absolute paths of Dart files differing from the base, staged changes included."""
    base_commit = base or git_output("merge-base", DEFAULT_BASE_BRANCH, "HEAD").strip()
    names = git_output(
        "diff", "--name-only", "--diff-filter=d", base_commit, "--", "*.dart"
    )
    return {Path(name).resolve() for name in names.splitlines()}


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


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--base", help="Vergleichs-Commit, sonst die Abzweigung von origin/master"
    )
    parser.add_argument(
        "files", nargs="*", help="von pre-commit übergeben und nicht verwendet"
    )
    arguments = parser.parse_args()

    analyzer = subprocess.run(  # noqa: S603
        ["dart", "analyze", "--format=machine"],  # noqa: S607
        capture_output=True,
        text=True,
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
