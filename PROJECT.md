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

## Bilingual reading structure

Korean is the original, canonical prose, and an English translation is placed alongside it. The site publishes both languages as sibling reading trees:

- Korean canon lives under `/ko`, for example [https://savagemanage.github.io/omelas/ko/01-revelation/00-index/](https://savagemanage.github.io/omelas/ko/01-revelation/00-index/).
- The English translation lives under `/en`, for example [https://savagemanage.github.io/omelas/en/01-revelation/00-index/](https://savagemanage.github.io/omelas/en/01-revelation/00-index/).
- Every page carries a language-switch control. Korean and English versions of the same chapter share a `translation_key` (for example `01-revelation/chapter-01`), and the layout uses that key to build the link to the counterpart page, so you can toggle between languages while reading.
- The translation never alters the Korean canon; it sits next to it.

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

- `books/` - the finished Korean prose. Nine book directories (`NN-<slug>/`), each with a `00-index.md` introduction and `chapter-01.md` through `chapter-06.md` (54 chapters in total). This is the canonical source and is never mutated in place.
- `canon/` - Korean translations of the frozen root files, the story bible (`story-bible-ko.md`), and the translation glossary (`translation-glossary.md`) that keeps canon terminology and name romanization consistent across the English translation. This is canon reference material.
- `Gemfile` and `Gemfile.lock` - the pinned Ruby dependencies (Jekyll and the plugins the site uses).
- `_config.yml` - the Jekyll configuration: site title, `url` and `baseurl` (`/omelas`), the dark default, and the two bilingual collections.
- `_ko/` and `_en/` - the generated Jekyll collections for the Korean canon (`/ko`) and the English translation (`/en`). Each document carries front-matter linking it to its counterpart. These trees are committed so the Pages build needs no pre-step.
- `_layouts/` and `_includes/` - the Jekyll templates. `_layouts/` holds `default.html`, `book.html`, and `chapter.html`; `_includes/` holds the header/nav and the language-switch control.
- `assets/css/omelas.css` - the dark, book-matched theme (slate background, muted indigo accent, Hangul-friendly Noto Serif KR serif, comfortable long-form measure).
- `index.html` - the bilingual landing page (the Omelas cover plus entry points into the Korean and English reading trees).
- `scripts/build_bilingual.rb` - the generation script that reads `books/` and writes the `_ko` and `_en` collection trees without editing the sources. See `scripts/README.md`. Re-run it when the Korean source prose changes.
- `DEPLOY.md` - full deployment notes (Korean) covering the Jekyll build and GitHub Actions deploy.
- `README.md`, `ideation.md`, `page-1.md` - frozen English originals at the repository root (canon).
- `_site/` - the generated build artifact. It is gitignored and must not be committed.

## Canon and no-edit policy

The prose is complete. The following are canon and must not be altered:

- The English root files `README.md`, `ideation.md`, and `page-1.md`.
- All prose under `books/`.
- Everything under `canon/` (Korean translations, the story bible, and the glossary).

Per the story bible, no file in this repository should contain the long em dash character; use regular hyphens or rephrase instead.

## Build and preview locally

You need Ruby 3.4 with Bundler. The steps below mirror `DEPLOY.md`; see that file for full deployment details.

1. Install dependencies:

   ```bash
   bundle install
   ```

2. Preview with a local server (opens at http://127.0.0.1:4000/omelas/):

   ```bash
   bundle exec jekyll serve
   ```

3. Build the static site into `./_site`:

   ```bash
   bundle exec jekyll build
   ```

If you change the Korean source prose under `books/`, regenerate the reading trees and commit them:

```bash
ruby scripts/build_bilingual.rb
```

## Deployment

Pushes to the `main` branch trigger the `.github/workflows/pages.yml` GitHub Actions workflow, which sets up Ruby, installs dependencies with Bundler, runs `bundle exec jekyll build` with `JEKYLL_ENV=production`, and deploys the resulting `_site/` to GitHub Pages. See `DEPLOY.md` for the complete procedure and the one-time GitHub Pages source setup.
