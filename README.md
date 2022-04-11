# 만국박람회 프로젝트 저장소

## 타임라인
- 프로젝트 기간: 20220411 ~ 20220422(2주)

## UML
![](https://i.imgur.com/Ar8FyKP.png)

## 팀원 및 리뷰어
팀원: [Tiana](https://github.com/Kim-TaeHyun-A), [쿼카](https://github.com/Quokkaaa), 리뷰어: [Tony](https://github.com/Monsteel)

## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 그라운드룰
- 점심시간 12시 ~ 2시
- 저녁시간 7시 - 8시

[Tiana]
- 안되는 시간 없음

[쿼카]
- 안되는시간 
    - 22일 이사가야돼서 금요일은 빼고 프로젝트를 생각해볼 수 있을까요 ?

## git flow

: 브랜치 전략 중 하나.
브랜치 생성, 머지 등 흐름 파악.
checkout, merge, tag 사용되는 깃 명령어 많지 않아 단순
1개월 이상 긴 개발 시 사용

1. master : 앱 출시 브랜치, release가 병합됨

2. develop : 다음 출시 버전 개발, feature가 기능 완료하면 develop에 합쳐짐, 배포 시 master에 합칠 때 develop에도 합침(이후 버전 개발을 위해)

3. feature(s) : 단일 기능 개발, develop에서 브랜치 따서 기능 개발, feature-기능 : 브랜치 이름

4. release(s) : 다음 버전 배포 준비(버전명, 심사 실패 시버그 수정), develop에서 새 버전 배포하기 위해 생성

5. hotfix(s) : 배포한 앱에서 발생한 급한 버그 수정, master에서 브랜치 생성 후 master로 바로 합침, 버전과 빌드 번호도 여기서 수정 후 배포
cf. (s) → 여러 개 만들 수 있는 브랜치들


## STEP1 핵심경험
- Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환

## Step 2 핵심경험
- 테이블뷰의 Delegate와 Data Source의 역할의 이해
- 테이블뷰의 셀의 재사용 이해
- 테이블뷰의 전반적인 동작 방식의 이해
- 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- 내비게이션 컨트롤러를 활용한 화면 전환
- 뷰 컨트롤러 사이의 데이터 전달
