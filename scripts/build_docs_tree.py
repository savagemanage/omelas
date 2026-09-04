#!/usr/bin/env python3
"""Populate the MkDocs docs_dir with symlinks to the real content.

MkDocs 1.6 forbids docs_dir from being the repository root (the parent of
mkdocs.yml) and forbids site_dir from living inside docs_dir. To keep every
prose file byte-identical on disk while still building the whole repo, this
script creates a docs/ directory whose entries are symlinks pointing back at
the original files and folders. Symlinks are new files, so no existing prose
is copied or modified.

Run from the repository root:

    python3 scripts/build_docs_tree.py

It is safe to run repeatedly; docs/ is rebuilt from scratch each time.
"""

from __future__ import annotations

import os
import shutil
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
DOCS_DIR = REPO_ROOT / "docs"

# Top-level entries to expose in the site, mapped to their name inside docs/.
# docs_home.md is a dedicated Korean landing page listing every book; it becomes
# index.md so Home renders at the site root without touching the English README.
LINKS = {
    "docs_home.md": "index.md",
    "books": "books",
    # The custom stylesheet is referenced via extra_css in mkdocs.yml. Because
    # docs_dir is this symlink tree, the assets directory must be exposed here
    # or `mkdocs build --strict` fails on the missing extra_css file.
    "assets": "assets",
}


def main() -> None:
    if DOCS_DIR.exists() or DOCS_DIR.is_symlink():
        if DOCS_DIR.is_symlink() or DOCS_DIR.is_file():
            DOCS_DIR.unlink()
        else:
            shutil.rmtree(DOCS_DIR)
    DOCS_DIR.mkdir(parents=True)

    for source_name, link_name in LINKS.items():
        source = REPO_ROOT / source_name
        if not source.exists():
            raise SystemExit(f"Expected source not found: {source}")
        link_path = DOCS_DIR / link_name
        relative_target = os.path.relpath(source, DOCS_DIR)
        os.symlink(relative_target, link_path)
        print(f"linked {link_name} -> {relative_target}")


if __name__ == "__main__":
    main()
