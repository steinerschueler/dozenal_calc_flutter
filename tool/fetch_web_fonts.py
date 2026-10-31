#!/usr/bin/env python3
"""Copy the fallback fonts of a Flutter web build into build/web/fonts/.

The engine names its fonts in main.dart.js. They change with the Flutter version,
so this runs after every `flutter build web` instead of keeping copies in the repo.
"""

import re
import sys
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

FONT_SOURCE_URL = "https://fonts.gstatic.com/s/"
FONT_PATH_PATTERN = re.compile(r'"([a-z0-9]+/v\d+/[A-Za-z0-9_.\-]+\.(?:woff2|ttf))"')
BUILD_DIR = Path("build/web")
DOWNLOAD_WORKERS = 8


def font_paths(compiled_app: Path) -> list[str]:
    """Return the font paths named by the compiled app, without duplicates."""
    return sorted(set(FONT_PATH_PATTERN.findall(compiled_app.read_text(errors="ignore"))))


def download_font(font_path: str, target_dir: Path) -> None:
    """Download one font unless it is already present."""
    target = target_dir / font_path
    if target.exists():
        return
    target.parent.mkdir(parents=True, exist_ok=True)
    with urllib.request.urlopen(FONT_SOURCE_URL + font_path, timeout=60) as response:
        partial = target.with_name(target.name + ".part")
        partial.write_bytes(response.read())
    # An interrupted run must not leave a file that later runs accept as complete.
    partial.replace(target)


def main() -> int:
    compiled_app = BUILD_DIR / "main.dart.js"
    if not compiled_app.exists():
        print("build/web/main.dart.js fehlt: zuerst flutter build web ausführen.", file=sys.stderr)
        return 1
    paths = font_paths(compiled_app)
    if not paths:
        print("Keine Schriftpfade gefunden: Das Format von main.dart.js hat sich geändert.", file=sys.stderr)
        return 1
    with ThreadPoolExecutor(max_workers=DOWNLOAD_WORKERS) as pool:
        list(pool.map(lambda font_path: download_font(font_path, BUILD_DIR / "fonts"), paths))
    print(f"{len(paths)} Schriften in {BUILD_DIR / 'fonts'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
