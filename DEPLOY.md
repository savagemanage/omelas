# 배포 안내 (Deployment)

이 저장소는 정적 사이트로 빌드되어 GitHub Pages에 게시됩니다. 아래 내용은 사이트가 어떻게 배포되는지, 그리고 로컬에서 어떻게 미리 보고 빌드하는지를 설명합니다.

## 선택한 방식 (Approach)

- **MkDocs Material로 빌드하고 GitHub Actions로 GitHub Pages에 배포합니다.**
- 모든 책과 장은 마크다운 그대로 유지되며, MkDocs가 상대 `.md` 링크를 사이트 URL로 변환합니다. 원본 산문 파일은 한 글자도 수정하지 않습니다.
- GitHub Actions를 쓰면 `main` 브랜치에 반영되는 즉시 사이트가 자동으로 다시 빌드되고 게시되므로, 별도의 수동 업로드나 빌드 산출물 커밋이 필요 없습니다. 빌드된 `./site` 디렉터리는 저장소에 커밋하지 않습니다.

## 최초 1회 수동 설정 (One-time setup)

저장소 소유자는 처음에 한 번만 아래 설정을 해야 합니다.

1. GitHub 저장소의 **Settings** 로 이동합니다.
2. 왼쪽 메뉴에서 **Pages** 를 선택합니다.
3. **Build and deployment** 항목에서 **Source** 를 **"GitHub Actions"** 로 설정합니다.

이 설정을 마치면 워크플로가 실행될 때 사이트가 게시됩니다. 게시 주소는 다음과 같습니다.

`https://savagemanage.github.io/omelas/`

## 자동 배포 (Automatic deploys)

- `main` 브랜치에 푸시가 일어나면 `.github/workflows/pages.yml` 워크플로가 실행됩니다.
- 워크플로는 의존성을 설치하고, 문서 트리를 구성한 뒤, `mkdocs build --strict` 로 사이트를 빌드하고 GitHub Pages에 배포합니다.
- **Actions** 탭에서 수동으로 워크플로를 실행할 수도 있습니다 (workflow_dispatch).

## 로컬 미리보기 및 빌드 (Local preview and build)

1. 의존성 설치:

   ```bash
   python3 -m pip install -r requirements.txt
   ```

2. 문서 트리(심볼릭 링크) 구성:

   ```bash
   python3 scripts/build_docs_tree.py
   ```

3. 미리보기 서버 실행:

   ```bash
   python3 -m mkdocs serve
   ```

   브라우저에서 http://127.0.0.1:8000 을 엽니다.

4. 사이트 빌드 (산출물은 `./site` 에 생성):

   ```bash
   python3 -m mkdocs build
   ```

## 참고 (Note)

워크플로 파일(`.github/workflows/pages.yml`)은 기본 브랜치에 직접 푸시하지 않고 풀 리퀘스트(PR)를 통해 전달됩니다.
