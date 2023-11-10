# 🤜만국 박람회

사용자가 만국 박람회의 출품작들과 출품작의 상세설명을 확인 할 수 있습니다.

## 목차

1. [팀원](#1-팀원)
2. [다이어그램](#2-다이어그램)
3. [타임라인](#3-타임라인)
4. [실행 화면(기능 설명)](#4-실행화면기능-설명)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [참고 링크](#6-참고-링크)
7. [팀 회고](#7-팀-회고)

<br>

## 1. 팀원

| [Toy](https://github.com/DevWooHyeon)  | [kiseok](https://github.com/carti1108) |
| :--------: | :--------: |
|<img src=https://github.com/carti1108/ios-exposition-universelle/assets/114901495/bc23a074-5220-436e-9474-1c34f218cf97 width="150" height="150"/>|<img src=https://github.com/carti1108/ios-exposition-universelle/assets/114901495/9572f83a-d5ee-44e0-9dc4-7c021d15791e width="150" height="150"/> |


<br>

## 2. 다이어그램

<img width="993" alt="만국 다이어그램" src="https://github.com/carti1108/ios-exposition-universelle/assets/114901495/bca9f367-cbd4-4fd0-917e-d6c76ea83b53">



<br>

## 3. 타임라인
|날짜|내용|
|------|---|
|23.10.30|프로젝트 시작 전 개인 공부|
|23.10.31|JSON 포멧의 데이터와 매칭할 모델 타입 구현
|23.11.01|네이밍 수정<br>전체 화면 구현(StoryBoard)<br>파싱한 데이터 뷰에 업데이트하는 기능 구현<br>화면 전환 구현| 
|23.11.02|네이밍 및 컨벤션 수정|
|23.11.03|네이밍 및 컨벤션 수정<br>Decoder 모델 생성| 
|23.11.04|네이밍 및 컨벤션 수정<br>에러 타입 생성|
|23.11.06|네이밍 및 컨벤션 수정|
|23.11.07|네이밍 및 컨벤션 수정|
|23.11.08|오토레이아웃 구현|
|23.11.09|오토레이아웃 수정<br>READ ME작성|

## 4. 실행화면(기능 설명)
- 쥬스 주문 시 재고 감소 및 재고 수정 화면이동


| 메인 화면 | 한국의 출품작 목록 화면 | 상세 화면 |
| :--------: | :--------: | :--------: |
| ![메인 화면](https://github.com/carti1108/ios-exposition-universelle/assets/114901495/4febe427-a7c6-4462-8d2b-1a4f4af1d8be)|![리스트 화면](https://github.com/carti1108/ios-exposition-universelle/assets/114901495/1c13bed0-177f-4c78-9208-196c9f54b10f)|![상세 화면](https://github.com/carti1108/ios-exposition-universelle/assets/114901495/e6caa335-3aea-4c5f-8640-1560c78212ce)|

| 이전 화면 돌아가기 | 화면 회전 |
| :--------: | :--------: |
| ![이전 화면](https://github.com/carti1108/ios-exposition-universelle/assets/114901495/72c7b821-a8e2-49b1-be3b-06cd9b9fe601)|![화면 회전](https://github.com/carti1108/ios-exposition-universelle/assets/114901495/3989f779-847d-44b6-9826-6c134e3c40d1)|



<br>

## 5. 트러블 슈팅
1️⃣ Decoder 모델 생성
  - 여러 뷰컨트롤러에서 동일한 로직을 사용하는 문제점 발견
```swift
  struct DataDecoder<Element: Decodable> {
    
    func parse(assetName: String) throws -> Element {
        guard let dataAsset = NSDataAsset(name: assetName) else {
            throw ParseError.dataAssetError
        }
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode(Element.self, from: dataAsset.data) else {
            throw ParseError.parseFailure
        }
        
        return decodedData
    }
}
```
위 방식으로 파싱하는 부분을 모델로 분리 후 여러 뷰컨트롤러에서 사용하도록 변경

2️⃣ 메서드 주입 방식
  - 테이블 뷰 내의 셀이나 다음 뷰컨트롤러에 데이터를 전달해 주는 방식이 높은 결합도를 가지고 있다는 문제점 발견
```swift
func setUp(asset: ExhibitionItem) {
        navigationTitle = asset.name
        itemImage = asset.imageName
        itemDescription = asset.description
    }
```
```swift
func configureCell(asset: ExhibitionItem) {
        itemImageView.image = UIImage(named: asset.imageName)
        itemNameLabel.text = asset.name
        itemDescriptionLabel.text = asset.shortDescription
    }
```
위 방식으로 객체의 프로퍼티에 직접 접근하지 않고 각 객체의 메서드를 통해 전달하는 방식으로 변경




<br>

## 6. 참고 링크
[📖 공식문서 UITableView](https://developer.apple.com/documentation/uikit/uitableview)<br>
[📖 공식문서 TableViews](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)<br>
[📖 공식문서 Filling a table with data](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/filling_a_table_with_data)<br>
[📖 공식문서 Configuring the cells for your table](https://developer.apple.com/documentation/uikit/views_and_controls/table_views/configuring_the_cells_for_your_table)<br>
[📖 공식문서 JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)




<br>

## 7. 팀 회고

<details>
<summary>팀 회고</summary>

- 😄우리팀이 잘한 점
거침없는 프로젝트 진행

- 😅우리팀이 개선할 점
거침많은 프로젝트 결과물
</details>


