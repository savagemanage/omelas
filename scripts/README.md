# scripts/

## build_bilingual.rb

Generates the two Jekyll reading collections from the canonical Korean prose.

- Reads every `books/NN-<slug>/*.md`.
- Writes `_ko/<slug>/<name>.md` by prepending YAML front-matter (`lang`,
  `layout`, `book`, `book_num`, `chapter`, `title`, `translation_key`) to a
  byte-for-byte copy of the original Korean body. It NEVER edits `books/*.md`.
- Writes `_en/<slug>/<name>.md` as a structural mirror with full English
  front-matter and a placeholder body (`Translation in progress.`). The real
  English translations replace those placeholders in later features.

The generated `_ko/` and `_en/` trees are committed to the repository, so the
GitHub Pages build is a plain `bundle exec jekyll build` with no pre-step.

Re-run the generator whenever the Korean source prose under `books/` changes,
then commit the regenerated trees:

```sh
ruby scripts/build_bilingual.rb
```

The script is idempotent: it clears and rebuilds `_ko/` and `_en/` on each run.
It also aborts if it ever encounters an em dash (U+2014) in the source.
