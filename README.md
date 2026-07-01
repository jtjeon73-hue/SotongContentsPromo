# 소통웨어 콘텐츠 / SotongContentsPromo

소통웨어 유튜브/콘텐츠 사업 총괄 홍보사이트입니다.

AI 음악, 지역 생활 영상, 시골 생활 콘텐츠, 앱 홍보 영상, 쇼츠 콘텐츠를 기획하고 제작하는 **소통웨어 콘텐츠** 브랜드의 공개 포트폴리오 허브 사이트입니다.

## 프로젝트명

- **한글명:** 소통웨어 콘텐츠
- **영문명:** Sotong Contents Lab
- **저장소:** SotongContentsPromo

## 목적

소통웨어에서 제작하는 AI 음악, 지역 생활밀착 영상, 시골 생활 콘텐츠, 앱 홍보 영상, 쇼츠 콘텐츠, 브랜드 콘텐츠를 한곳에서 소개하는 **유튜브/콘텐츠 사업 총괄 홍보사이트**입니다.

## 주요 콘텐츠 영역

- AI 음악
- 지역 생활 영상
- 시골 생활 콘텐츠
- 앱 홍보 영상
- 쇼츠 콘텐츠
- 브랜드 콘텐츠
- 전자책 홍보 영상
- 스마트스토어 상품 영상

## 대표 연락처

- **이메일:** sotongware@naver.com

## 실행 방법

```powershell
flutter pub get
flutter run -d chrome
```

## GitHub Pages 빌드 방법 (Windows PowerShell)

```powershell
flutter clean
flutter pub get
dart format .
flutter analyze
flutter build web --base-href /SotongContentsPromo/
```

## docs 폴더 생성 방법

```powershell
Remove-Item -Recurse -Force docs -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path docs
Copy-Item -Path build/web/* -Destination docs -Recurse
New-Item -ItemType File -Path docs/.nojekyll -Force
```

`docs/.nojekyll` 파일은 GitHub Pages가 Jekyll 처리를 하지 않도록 유지해야 합니다.

## GitHub Pages 설정

1. GitHub 저장소 **Settings** → **Pages**
2. **Source:** Deploy from a branch
3. **Branch:** `main`
4. **Folder:** `/docs`
5. **Save**

## 배포 후 예상 주소

https://jtjeon73-hue.github.io/SotongContentsPromo/

## 배포 후 확인할 것

- [ ] 404 오류 여부
- [ ] CSS/폰트/이미지 적용 여부
- [ ] 모바일 반응형 여부
- [ ] 카카오톡 공유 미리보기
- [ ] 새로고침 정상 여부
- [ ] 이메일 문의 버튼 동작 여부

## 기술 스택

- Flutter Web
- GitHub Pages (`/SotongContentsPromo/` base-href)

## 라이선스

Public Promo Site — 소통웨어 콘텐츠 홍보용
