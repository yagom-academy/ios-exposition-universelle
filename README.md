## 야곰 아카데미

### 만국박람회 프로젝트 저장소

>프로젝트 기간 2022.06.13 ~ 2022.06.14
>
>팀원 : [unchain123](https://github.com/unchain123), [bard](https://github.com/bar-d)/ 리뷰어 : [콘](https://github.com/protocorn93)
## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [고민한점](#고민한점)
- [배운개념](#배운개념)

## 프로젝트 소개
- json데이터, 테이블 뷰를 이용해서 만국박람회 구성하기

## Preview
## UML
### step1


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 키워드
- `Codable`, `CodingKey`
- `JSON`, `Asset`, `Dummy JSON file`

## 고민한점
- JSON 파일을 어떻게 불러올 것인가?

- 프로젝트 폴더 내에 JSON폴더를 넣어서 경로로 가져오기

- Asset 파일에 넣어서 가져오기 -> 코드로 어떻게 가져옴?  UIImageAsset?

- String 파일 내에 복사 붙여넣기 해서 불러오기 -> 일종의 더미 데이터 값

- String 파일 내 주석을 제거 안해줬더니 무한루프 발생 -> String 파일로 생성을 해주었지만, json 파일로 변경되면서 json 내 주석과 String 파일 내 주석 방식이 달라 무한 루프가 걸린 듯?

- JS내에서도 여러줄 주석처리가 /* */ 로 처리하는데 왜 json 파일에서는 적용되지 않는 것인가?


## 배운개념
- `JSON` : 메모리에 있던 객체를 사람이 읽고 쓰기 쉽게 문자열로 표현해놓은 방법론
- `Codable` : 자신을 변환하거나 외부표현(external representation)으로 변환할 수 있는 타입
- `JSON 파일을 파싱하는 방법들`
    1. String 파일로 JSON 파일을 목 데이터로 가져오기
    2. 프로젝트 폴더 내에 JSON 파일 집어넣어서 가져오기
    3. 서버를 만들어 JSON 파일 가져오기






