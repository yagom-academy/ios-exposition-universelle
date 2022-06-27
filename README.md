# 만국박람회 README.md
>프로젝트 기간 2022.06.13 ~ 2022.06.14
>
>팀원 : [unchain123](https://github.com/unchain123), [bard](https://github.com/bar-d)/ 리뷰어 : [콘](https://github.com/protocorn93)
## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [STEP1](#STEP1)
    - [고민한점](#고민한점-자세히보기)
    - [배운개념](#배운개념)

## 프로젝트 소개
- json데이터, 테이블 뷰를 이용해서 만국박람회 구성하기
- 코드만 사용해서 UI 구현(스토르보드 제거)

## 개발자 소개
|바드|언체인|
|:---:|:---:|
|<img src="https://avatars.githubusercontent.com/u/92622931?v=4" width="250" height="250">|<img src="https://i.imgur.com/gEAc4rf.png" width="250" height="250">|
|[@bard](https://github.com/bar-d)|[unchain123](https://github.com/unchain123)|



## 타임라인

## Preview
## 기본 구현 방식
<img src="https://i.imgur.com/xLGt5Qk.gif" width="250" height="450"/>   &nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/EL7YBCC.gif" width="250" height="450"/>

<img src="https://i.imgur.com/stXFxGl.png" width="300" height="550"/>   &nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/t8cNCxn.png" width="300" height="550"/>

<img src="https://i.imgur.com/u8UIGFM.png" width="300" height="550"/>   &nbsp;&nbsp;&nbsp;<img src="https://i.imgur.com/KlO854d.png" width="300" height="550"/>




## UML

<img src="https://i.imgur.com/OGGKLIN.jpg" width="800" height="800"/>   


## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 키워드
- `Codable`, `CodingKey`
- `JSON`, `Asset`, `Dummy JSON file`
- `tableView`, `segue`, ` `
## 고민한점 자세히보기
[STEP1에서 고민한점](https://github.com/yagom-academy/ios-exposition-universelle/pull/169)

## 배운개념
- `JSON` : 메모리에 있던 객체를 사람이 읽고 쓰기 쉽게 문자열로 표현해놓은 방법론
- `Codable` : 자신을 변환하거나 외부표현(external representation)으로 변환할 수 있는 타입
- `JSON 파일을 파싱하는 방법들`
    1. String 파일로 JSON 파일을 목 데이터로 가져오기
    2. 프로젝트 폴더 내에 JSON 파일 집어넣어서 가져오기
    3. 서버를 만들어 JSON 파일 가져오기
    
# STEP2

## 키워드
- `JSON 파싱`
- `NSDataAsset`, `type casting`
- `NumberFormatter`, `dequeueReusableCell(withIdentifier:, for:)`
- `ScrollView`, `TableView`, `indexPath`
-  `navigationController`, `prepare`, `navigationItem`, `UITableViewCell`
## 고민한점

### `오토레이아웃`
- 아직 오토레이아웃에 대한 정확한 개념이 잡힌 것 같지가 않아 스토리보드로 될 것 같은 방식으로 구현 후, 이것저것 시도해보며 오토레이아웃 작성  
테이블 뷰 및 스크롤 뷰에서 뷰를 추가하지 않으면 스크롤링이 되지 않는다는 것을 늦게 깨달아 프로젝트를 진행하는데 시간이 오래 걸림

## `objc`
![](https://i.imgur.com/yh8asQR.png)
- extension을 사용하여 @objc 함수를 사용하려고 했지만, 이러한 에러 메세지가 나타났다.  
@objc를 사용하기 위해서는 @objc프로토콜을 따르거나 클래스 내에서 사용해야 한다고 함



## 배운개념

