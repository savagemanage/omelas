# 배포 안내 (Deployment)

이 저장소는 Jekyll 정적 사이트로 빌드되어 GitHub Pages에 게시됩니다. 아래 내용은 사이트가 어떻게 배포되는지, 그리고 로컬에서 어떻게 미리 보고 빌드하는지를 설명합니다.

## 선택한 방식 (Approach)

- **Jekyll로 빌드하고 GitHub Actions로 GitHub Pages에 배포합니다.**
- 원본 한국어 산문 파일(`books/`)은 한 글자도 수정하지 않습니다. 생성 스크립트가 원문 본문을 그대로 복사해 컬렉션 문서로 옮기므로, 원본은 바이트 단위로 동일하게 유지됩니다.
- GitHub Actions를 쓰면 `main` 브랜치에 반영되는 즉시 사이트가 자동으로 다시 빌드되고 게시되므로, 별도의 수동 업로드나 빌드 산출물 커밋이 필요 없습니다. 빌드된 `./_site` 디렉터리는 저장소에 커밋하지 않습니다.

## 이중 언어 구조 (Bilingual structure)

- 이 사이트는 한국어 정본과 영어 번역을 나란히 제공합니다.
- 한국어 정본은 `/ko` 아래에서 읽습니다. 예: `https://savagemanage.github.io/omelas/ko/01-revelation/00-index/`
- 영어 번역은 `/en` 아래에서 읽습니다. 예: `https://savagemanage.github.io/omelas/en/01-revelation/00-index/`
- 각 페이지에는 언어 전환 링크가 있어 같은 장의 한국어와 영어 사이를 오갈 수 있습니다. 두 언어는 공유 키(`translation_key`)로 서로 연결되어 있어 대응하는 상대 언어 페이지로 바로 이동합니다.
- 두 언어는 Jekyll 컬렉션(`_ko`, `_en`)으로 관리되며, 한국어가 원본이고 영어가 그 번역입니다. 번역은 한국어 정본을 바꾸지 않습니다.

## 최초 1회 수동 설정 (One-time setup)

저장소 소유자는 처음에 한 번만 아래 설정을 해야 합니다.

1. GitHub 저장소의 **Settings** 로 이동합니다.
2. 왼쪽 메뉴에서 **Pages** 를 선택합니다.
3. **Build and deployment** 항목에서 **Source** 를 **"GitHub Actions"** 로 설정합니다.

이 설정을 마치면 워크플로가 실행될 때 사이트가 게시됩니다. 게시 주소는 다음과 같습니다.

`https://savagemanage.github.io/omelas/`

## 자동 배포 (Automatic deploys)

- `main` 브랜치에 푸시가 일어나면 `.github/workflows/pages.yml` 워크플로가 실행됩니다.
- 워크플로는 Ruby를 설정하고 `bundle install` 로 의존성을 캐시한 뒤, `JEKYLL_ENV=production` 으로 `bundle exec jekyll build` 를 실행해 `./_site` 를 만들고, 그 산출물을 GitHub Pages에 배포합니다. `_ko` 와 `_en` 컬렉션은 이미 저장소에 커밋되어 있으므로 별도의 생성 단계 없이 곧바로 빌드됩니다.
- **Actions** 탭에서 수동으로 워크플로를 실행할 수도 있습니다 (workflow_dispatch).

## 로컬 미리보기 및 빌드 (Local preview and build)

로컬에는 Ruby 3.4와 Bundler가 필요합니다.

1. 의존성 설치:

   ```bash
   bundle install
   ```

2. 미리보기 서버 실행:

   ```bash
   bundle exec jekyll serve
   ```

   브라우저에서 http://127.0.0.1:4000/omelas/ 를 엽니다.

3. 사이트 빌드 (산출물은 `./_site` 에 생성):

   ```bash
   bundle exec jekyll build
   ```

원본 한국어 산문을 새로 고쳤다면, `ruby scripts/build_bilingual.rb` 로 `_ko` 와 `_en` 트리를 다시 생성한 뒤 커밋합니다. 이 스크립트는 `books/` 를 수정하지 않습니다.

## 참고 (Note)

워크플로 파일(`.github/workflows/pages.yml`)은 기본 브랜치에 직접 푸시하지 않고 풀 리퀘스트(PR)를 통해 전달됩니다.
