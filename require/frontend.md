# Frontend Architecture (프론트엔드 아키텍처)

## MVVM 패턴 구조
- Model: 데이터와 비즈니스 로직을 담당
- View: UI 요소와 사용자 인터페이스를 담당
- ViewModel: View와 Model 사이의 데이터 바인딩과 비즈니스 로직을 담당

## 현재 파일 구조
```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── routes.dart
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_theme.dart
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── location_service.dart
│   │   ├── payment_service.dart
│   │   └── storage_service.dart
│   └── utils/
│       ├── validators.dart
│       └── extensions.dart
├── data/
│   ├── models/
│   │   ├── user.dart
│   │   ├── station.dart
│   │   ├── accessory.dart
│   │   └── rental.dart
│   └── repositories/
│       ├── auth_repository.dart
│       ├── station_repository.dart
│       ├── accessory_repository.dart
│       └── rental_repository.dart
└── features/
    ├── auth/
    │   ├── views/
    │   │   ├── login_view.dart
    │   │   ├── signup_view.dart
    │   │   ├── signup_complete_view.dart
    │   │   └── terms_view.dart
    │   └── viewmodels/
    │       ├── login_viewmodel.dart
    │       └── signup_viewmodel.dart
    ├── home/
    │   ├── views/
    │   │   └── home_view.dart
    │   └── viewmodels/
    │       └── home_viewmodel.dart
    ├── map/
    │   ├── views/
    │   │   └── map_view.dart
    │   └── viewmodels/
    │       └── map_viewmodel.dart
    ├── rental/
    │   ├── views/
    │   │   ├── rental_view.dart
    │   │   ├── rental_detail_view.dart
    │   │   ├── rental_status_view.dart
    │   │   └── qr_scan_view.dart
    │   └── viewmodels/
    │       ├── rental_viewmodel.dart
    │       └── rental_detail_viewmodel.dart
    ├── payment/
    │   ├── views/
    │   │   ├── payment_view.dart
    │   │   └── payment_complete_view.dart
    │   └── viewmodels/
    │       └── payment_viewmodel.dart
    ├── notice/
    │   ├── views/
    │   │   ├── notice_list_view.dart
    │   │   └── notice_detail_view.dart
    │   └── viewmodels/
    │       └── notice_viewmodel.dart
    └── mypage/
        ├── views/
        │   ├── mypage_view.dart
        │   └── edit_profile_view.dart
        └── viewmodels/
            └── mypage_viewmodel.dart
```

# 구현 완료된 기능 ✅

## Phase 1: 프로젝트 셋업 및 기본 구조 구현 ✅
1. Flutter 프로젝트 생성 및 기본 의존성 설정 ✅
2. 프로젝트 구조 셋업 ✅
3. 테마 및 상수 설정 ✅
4. 라우팅 시스템 구현 ✅

## Phase 2: 핵심 서비스 구현 ✅
1. 인증 서비스 구현 ✅
2. 위치 서비스 구현 ✅
3. 스토리지 서비스 구현 ✅

## Phase 3: 데이터 레이어 구현 ✅
1. 모델 클래스 구현 ✅
2. Repository 패턴 구현 ✅
3. API 통신 로직 구현 ✅

## Phase 4: 기능별 UI 및 비즈니스 로직 구현 ✅
1. 홈 화면 구현 ✅
   - 검색 기능 ✅
   - 공지사항 표시 ✅
   - 대여 현황 표시 ✅
   - 최근 이용 내역 표시 ✅
   - 지도 통합 ✅

2. 지도 기능 구현 ✅
   - 스테이션 마커 표시 ✅
   - 위치 권한 관리 ✅
   - 현재 위치 표시 ✅

3. 대여 기능 구현 ✅
   - 카테고리 필터링 ✅
   - 상품 상세 정보 ✅
   - QR 스캔 통합 ✅

4. 결제 시스템 구현 ✅
   - 결제 수단 연동 ✅
   - 결제 프로세스 ✅
   - 결제 완료 처리 ✅

5. 마이페이지 구현 ✅
   - 프로필 관리 ✅
   - 이용 내역 ✅
   - 고객 지원 기능 ✅

# 남은 작업
1. 단위 테스트 작성
2. 통합 테스트 구현
3. 성능 최적화
4. 배포 준비
   - 코드 리팩토링
   - 문서화
   - 빌드 및 배포 설정
   - 스토어 등록 준비

# 다음 단계
1. 결제 페이지 UI 구현
2. 결제 프로세스 구현
3. 결제 완료 후 처리 구현

# 추가 구현 사항
## 쿠키 사용 및 쿠키 관리
1. map_view.dart 에서 스테이션 선택 시 쿠키 저장
   - rental_view.dart 상단 스테이션 선택 버튼에 해당 스테이션 정보와 변경 기능 표시
   - rental_detail_view.dart 하단 스테이션 정보에 해당 스테이션 정보 표시
2. rental_detail_view.dart 에서 대여 아이템 선택 시 쿠키 저장
## 쿠키 삭제
- 결제 완료 시 쿠키 삭제
- 홈 화면 이동 시 쿠키 삭제
- 마이페이지 이동 시 쿠키 삭제

