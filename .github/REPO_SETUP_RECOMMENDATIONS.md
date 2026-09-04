# Repository Setup Recommendations

This document is for the repository owner. It contains recommended GitHub metadata (description, homepage, topics) and a license recommendation.

These metadata fields cannot be set from the automation environment used to prepare this repository (the GitHub API returns HTTP 403 for metadata edits here), so the values below are provided as text for you to apply manually in the GitHub UI.

> Note: the repository README is now Korean-first (the root `README.md` is the Korean project front page). The recommended "About" description below is therefore given in Korean first, with the English version kept as an optional alternative.

## Recommended "About" description (Korean, recommended)

Paste this into the repository "About" description field (Settings, or the gear icon next to "About" on the repository home page):

```
오멜라스 성서: 르 귄의 "오멜라스를 떠나는 사람들"에서 영감을 받은, 완결된 아홉 권짜리 한국어/영어 이중 언어 성서체 라이트 노벨. 온라인에서 읽기.
```

### Optional English alternative

If you prefer an English "About" description instead, this is an acceptable alternative:

```
Omelasian Bible: a completed nine-book bilingual Korean/English scripture-style light novel inspired by Le Guin's The Ones Who Walk Away from Omelas. Read online.
```

## Recommended homepage URL

Set the "Website" / homepage field to the live GitHub Pages site:

```
https://savagemanage.github.io/omelas/
```

## Recommended topics

Add these topics in the "About" panel. Topics are lowercase and hyphenated:

- `korean-literature`
- `light-novel`
- `fiction`
- `web-novel`
- `science-fiction`
- `dystopia`
- `ursula-k-le-guin`
- `mkdocs`
- `mkdocs-material`
- `github-pages`

## License recommendation

This repository is a creative prose work, not software. A Creative Commons license is a better fit than a software license (such as MIT or Apache-2.0), because software licenses are written for source code rather than for narrative writing.

No `LICENSE` file has been added to this repository. Choosing and adding a license is your decision as the owner. The options below are recommendations only.

- **Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 (CC BY-NC-ND 4.0)** - recommended conservative default for a finished narrative work. Others may share it with attribution, but not use it commercially and not publish adaptations or derivative versions.
- **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 (CC BY-NC-SA 4.0)** - allows non-commercial adaptations as long as they are shared under the same license, with attribution. Choose this if you want to permit fan works or translations.
- **Creative Commons Attribution 4.0 (CC BY 4.0)** - the most permissive option; allows commercial use and adaptations as long as you are credited. Choose this only if you are comfortable with broad reuse, including commercial reuse.

The final choice is yours. Nothing has been licensed on your behalf.

## How to apply these in GitHub

1. Open the repository on GitHub.
2. On the repository home page, click the gear icon next to "About" (or go to **Settings**).
3. Paste the description into the description field.
4. Enter `https://savagemanage.github.io/omelas/` in the website / homepage field.
5. Add the topics listed above, one at a time, and save.
6. To add a license, use **Add file -> Create new file**, name the file `LICENSE`, and GitHub will offer a "Choose a license template" button. Pick your preferred Creative Commons license there and commit it.
