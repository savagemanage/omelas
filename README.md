# 오멜라스 성서 (Omelasian Bible)

**오멜라스 성서(Omelasian Bible)** 는 어슐러 K. 르 귄의 단편 "오멜라스를 떠나는 사람들(The Ones Who Walk Away from Omelas)"에서 영감을 받은, 완결된 아홉 권짜리 한국어/영어 이중 언어 성서풍 라이트 노벨입니다. 어둡고 사색적인 종교-디스토피아 정조의 SF로, 한국어 정본 산문과 그에 나란히 놓인 영어 번역을 함께 정적 사이트로 공개합니다.

- 온라인으로 읽기: [https://savagemanage.github.io/omelas/](https://savagemanage.github.io/omelas/)

*English: a completed nine-book bilingual scripture-style light novel inspired by Le Guin's "The Ones Who Walk Away from Omelas". Read online at the link above.*

## 프로젝트 소개

무대는 한국, 특히 강남을 중심축으로 삼는 기계 유토피아 **오멜라스**입니다. 이 세계에서 사람의 정신은 **세계 3.0(World 3.0)** 이라는 네트워크로 업로드되며, 이 의식은 세례 또는 변환이라 불립니다. 이야기는 여러 진영 사이의 긴장을 따라갑니다.

- **선(Goods)**: **엔지니어(Engineers)** 와 **전도자(Evangelists)** 로 이루어진 무리.
- **악(Evils)**: **과학자(Scientists)** 로 이루어진 무리.
- **미변환자(Untransformed)**: 아직 의식을 거치지 않은 사람들.
- **동물(Animals)**.

산문은 이미 완결되었습니다. 이 저장소는 그 산문을 온라인에서 읽을 수 있도록 정적 사이트로 발행합니다.

## 온라인에서 읽는 법

한국어가 원본이자 정본 산문이며, 영어 번역이 그 옆에 나란히 놓입니다. 사이트는 두 언어를 형제 관계의 읽기 트리로 발행합니다.

- 한국어 정본은 `/ko` 아래에 있습니다. 예: [https://savagemanage.github.io/omelas/ko/01-revelation/00-index/](https://savagemanage.github.io/omelas/ko/01-revelation/00-index/)
- 영어 번역은 `/en` 아래에 있습니다. 예: [https://savagemanage.github.io/omelas/en/01-revelation/00-index/](https://savagemanage.github.io/omelas/en/01-revelation/00-index/)
- 모든 페이지 상단 헤더에는 언어 토글이 있어, 같은 장의 한국어와 영어 판본을 오가며 읽을 수 있습니다. 한국어 페이지와 영어 페이지는 같은 `translation_key`(예: `01-revelation/chapter-01`)를 공유하며, 레이아웃이 그 키로 대응 페이지 링크를 만듭니다.
- 번역은 한국어 정본을 결코 바꾸지 않으며, 그 옆에 함께 놓일 뿐입니다.

## 아홉 권의 책

각 권은 소개 페이지(`00-index`)와 여섯 개의 장으로 이루어집니다(전체 54개 장). 아래 링크는 각 권의 한국어 원천 소개 페이지를 가리킵니다.

1. 요한계시록 / Revelation - [books/01-revelation/00-index.md](books/01-revelation/00-index.md)
2. 창세기 / Genesis - [books/02-genesis/00-index.md](books/02-genesis/00-index.md)
3. 출애굽기 / Exodus - [books/03-exodus/00-index.md](books/03-exodus/00-index.md)
4. 판관기 / Judges - [books/04-judges/00-index.md](books/04-judges/00-index.md)
5. 시편 / Psalms - [books/05-psalms/00-index.md](books/05-psalms/00-index.md)
6. 잠언 / Proverbs - [books/06-proverbs/00-index.md](books/06-proverbs/00-index.md)
7. 신약 / New Testament - [books/07-new-testament/00-index.md](books/07-new-testament/00-index.md)
8. 아크로피아 / Acrophyia - [books/08-acrophyia/00-index.md](books/08-acrophyia/00-index.md)
9. 유년기 복음서 / Infancy Gospel - [books/09-infancy-gospel/00-index.md](books/09-infancy-gospel/00-index.md)

## 저장소 구조

- `books/` - 완성된 한국어 산문. 아홉 개의 권 디렉터리(`NN-<slug>/`)가 있으며, 각 권은 `00-index.md` 소개와 `chapter-01.md` 부터 `chapter-06.md` 까지(전체 54개 장)를 담습니다. 정본 원천이며 제자리에서 변형되지 않습니다.
- `_ko/` 와 `_en/` - 한국어 정본(`/ko`)과 영어 번역(`/en`)을 위해 생성된 Jekyll 컬렉션 트리입니다. 각 문서는 대응 판본으로 연결되는 front-matter를 갖습니다. 이 트리는 커밋되어 있어 Pages 빌드에 별도의 선행 단계가 필요 없습니다.
- `canon/` - 정본 참고 자료입니다. 원어 영문 정본은 이제 이곳에 `canon/README-en.md`, `canon/ideation-en.md`, `canon/page-1-en.md` 로 보존되어 있습니다. 또한 그 한국어 번역본(`canon/README-ko.md`, `canon/ideation-ko.md`, `canon/page-1-ko.md`), 스토리 바이블(`story-bible-ko.md`), 그리고 정본 용어와 이름 표기를 일관되게 유지하는 번역 용어집(`translation-glossary.md`)이 있습니다.
- `_layouts/` 와 `_includes/` - Jekyll 템플릿입니다. `_layouts/` 에는 `default.html`, `book.html`, `chapter.html` 이, `_includes/` 에는 헤더/내비게이션이 들어 있습니다.
- `assets/` - 책과 어울리는 테마 CSS(`assets/css/omelas.css`)와 테마 토글 스크립트(`assets/js/theme-toggle.js`).
- `index.html` - 이중 언어 랜딩 페이지(오멜라스 표지와 한국어/영어 읽기 트리로의 진입점).
- `scripts/build_bilingual.rb` - `books/` 를 읽어 원천을 편집하지 않고 `_ko` 와 `_en` 컬렉션 트리를 생성하는 스크립트입니다. `scripts/README.md` 를 참고하세요.
- `_config.yml` - Jekyll 설정: 사이트 제목, `url` 과 `baseurl`(`/omelas`), 두 이중 언어 컬렉션.
- `DEPLOY.md` - 전체 배포 안내(한국어). Jekyll 빌드와 GitHub Actions 배포를 다룹니다.
- `_site/` - 생성된 빌드 산출물입니다. gitignore 되어 있으며 커밋하지 않습니다.

## 로컬에서 빌드/미리보기/배포

Ruby 3.4 와 Bundler 가 필요합니다. 아래 단계는 `DEPLOY.md` 를 요약한 것이며, 전체 배포 절차는 그 파일을 참고하세요.

1. 의존성 설치:

   ```bash
   bundle install
   ```

2. 한국어 원천 산문(`books/`)을 바꾸었다면 읽기 트리를 다시 생성하고 커밋합니다(원천은 편집하지 않고 `_ko`/`_en` 만 갱신):

   ```bash
   ruby scripts/build_bilingual.rb
   ```

3. 정적 사이트를 `./_site` 로 빌드:

   ```bash
   bundle exec jekyll build
   ```

4. 로컬 서버로 미리보기(http://127.0.0.1:4000/omelas/ 에서 열림):

   ```bash
   bundle exec jekyll serve
   ```

## 배포

`main` 브랜치로 푸시하면 `.github/workflows/pages.yml` GitHub Actions 워크플로가 실행되어 Ruby 설정, Bundler 의존성 설치, `JEKYLL_ENV=production` 으로 `bundle exec jekyll build` 실행, 그리고 생성된 `_site/` 를 GitHub Pages 로 배포합니다. 전체 절차와 최초 1회 GitHub Pages 소스 설정은 `DEPLOY.md` 를 참고하세요.

## 정본과 표기 규칙

산문은 완결되었습니다. 다음은 정본이며 변형하지 않습니다.

- `canon/` 아래의 원어 영문 정본(`canon/README-en.md`, `canon/ideation-en.md`, `canon/page-1-en.md`).
- `books/` 아래의 모든 산문.
- `canon/` 아래의 모든 것(한국어 번역, 스토리 바이블, 용어집).

스토리 바이블 규칙에 따라, 이 저장소의 어떤 파일에서도 긴 줄표(엠 대시) 문자를 쓰지 않습니다. 일반 하이픈을 쓰거나 문장을 다시 씁니다.
