# Omelasian Bible - Project Guide

This is the English project guide for the **Omelasian Bible (오멜라스 성서)** repository.
It explains what the project is, where to read it, how the repository is organized, and how to build and preview the site locally.

> This guide is auxiliary documentation. It does not replace the frozen English originals at the repository root (`README.md`, `ideation.md`, `page-1.md`), which are canon and must not be altered. See the "Canon and no-edit policy" section below.

## What this project is

The Omelasian Bible is a completed nine-book Korean-language light novel inspired by Ursula K. Le Guin's short story "The Ones Who Walk Away from Omelas". The tone is dark, contemplative science fiction with a religious-dystopia framing.

The setting is a mechanical utopia named Omelas, anchored in Korea (Gangnam). In this world, human minds are uploaded to a network called **World 3.0** through a rite referred to as baptism, or transformation. The story follows the tensions between its factions:

- The **Goods**, made up of the **Engineers** and the **Evangelists**.
- The **Evils**, made up of the **Scientists**.
- The **Untransformed**, who have not undergone the rite.
- The **Animals**.

The prose is finished. This repository publishes it as a static site so it can be read online.

## Read online

The site is published with GitHub Pages at:

[https://savagemanage.github.io/omelas/](https://savagemanage.github.io/omelas/)

## The nine books

Each book has an introduction page and six chapters. The links below point to each book's index page under `books/`.

1. Revelation / 요한계시록 - [books/01-revelation/00-index.md](books/01-revelation/00-index.md)
2. Genesis / 창세기 - [books/02-genesis/00-index.md](books/02-genesis/00-index.md)
3. Exodus / 출애굽기 - [books/03-exodus/00-index.md](books/03-exodus/00-index.md)
4. Judges / 판관기 - [books/04-judges/00-index.md](books/04-judges/00-index.md)
5. Psalms / 시편 - [books/05-psalms/00-index.md](books/05-psalms/00-index.md)
6. Proverbs / 잠언 - [books/06-proverbs/00-index.md](books/06-proverbs/00-index.md)
7. New Testament / 신약 - [books/07-new-testament/00-index.md](books/07-new-testament/00-index.md)
8. Acrophyia / 아크로피아 - [books/08-acrophyia/00-index.md](books/08-acrophyia/00-index.md)
9. Infancy Gospel / 유년기 복음서 - [books/09-infancy-gospel/00-index.md](books/09-infancy-gospel/00-index.md)

## Repository layout

- `books/` - the finished prose. Nine book directories (`NN-<slug>/`), each with a `00-index.md` introduction and `chapter-01.md` through `chapter-06.md` (54 chapters in total).
- `canon/` - Korean translations and the story bible (`story-bible-ko.md`). This is canon reference material.
- `mkdocs.yml` - the MkDocs configuration, including the hand-written navigation, theme, and palette.
- `docs_home.md` - the Korean landing page. The build step symlinks it to `index.md` for the site.
- `scripts/build_docs_tree.py` - a pre-build step that assembles the `docs/` symlink tree MkDocs expects. It must run before every build.
- `requirements.txt` - pinned Python dependencies (MkDocs and mkdocs-material).
- `DEPLOY.md` - full deployment notes (Korean) covering GitHub Pages and GitHub Actions.
- `README.md`, `ideation.md`, `page-1.md` - frozen English originals at the repository root (canon).
- `docs/` and `site/` - generated build artifacts. Both are gitignored and must not be committed.

## Canon and no-edit policy

The prose is complete. The following are canon and must not be altered:

- The English root files `README.md`, `ideation.md`, and `page-1.md`.
- All prose under `books/`.
- Everything under `canon/` (Korean translations and the story bible).

Per the story bible, no file in this repository should contain the long em dash character; use regular hyphens or rephrase instead.

## Build and preview locally

You need Python 3 with the pinned dependencies. The steps below mirror `DEPLOY.md`; see that file for full deployment details.

1. Install dependencies:

   ```bash
   python3 -m pip install -r requirements.txt
   ```

2. Build the docs symlink tree (required before every build or serve):

   ```bash
   python3 scripts/build_docs_tree.py
   ```

3. Preview with a local server (opens at http://127.0.0.1:8000):

   ```bash
   python3 -m mkdocs serve
   ```

4. Build the static site into `./site`:

   ```bash
   python3 -m mkdocs build
   ```

For a stricter build that fails on warnings, use `python3 -m mkdocs build --strict`.

## Deployment

Pushes to the `main` branch trigger the `.github/workflows/pages.yml` GitHub Actions workflow, which installs dependencies, builds the docs tree, runs `mkdocs build --strict`, and deploys to GitHub Pages. See `DEPLOY.md` for the complete procedure and the one-time GitHub Pages source setup.
