# 🇰🇷🇳🇴🇬🇧 만국박람회

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

</br>

## 🍀 소개
TableView, TableViewCell, ScrollView등을 이용해 구현한 만국박람회입니다.

* 주요 개념: UITableView, Table Views, JSON, JSONDecoder, UITableViewCell, Reuse Cell

</br>

## 👨‍💻 팀원
| redmango | hamg |
| :--------: | :--------: |
| <Img src = "https://hackmd.io/_uploads/HJ2D-DoNn.png" width="200" height="200"> |<Img src="https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="200" height="200"> |
|[Github Profile](https://github.com/redmango1447) |[Github Profile](https://github.com/Hoon94) |



</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.06.26| JSON파일 파싱을 위한 Model 구현|
|2023.06.27| `ExpositionInfoViewController` 생성,  `scrollView` 추가 하여 Layout설정, `JSON` 파싱 진행 |
|2023.06.28| 개인 공부날이라서 그냥 지우는 방향으로??   | 
|2023.06.29| `ItemListView` 에서 `Item`의 `JSON` 파싱진행, `DetailItemViewController` 생성 및 데이터 파싱 진행 |
|2023.06.30| 파일분리, `navigationBarColor`설정, REDAME작성 |

</br>

## 👀 시각화된 프로젝트 구조 - 추후 추가

### Diagram
<p align="center">
<img width="800" src="">
</p>

</br>

## 💻 실행 화면 - 추후 추가

</br>

## 🧨 트러블 슈팅

1️⃣ **Decoder가 반복 되는점**
-
🔒 **문제점** 
-  `Exposition`, `Item` 2개의 타입을 파싱을 진행 해야 합니다. 그렇기에 `이름`만다르게 데이터를 파싱을 해야하기 때문에  코드를 재사용 할 수 있게 작성을 하기위해 고민을 하게 되었습니다. 
<br>

🔑 **해결방법** 
-
```swift
extension JSONDecoder {
    func decodingContentInfo<T:Decodable>(with contentData: Data, modelType:T.Type) throws -> T {
        let decodedModel = try self.decode(T.self, from: contentData)
        
        return decodedModel
    }
}
```
- 이렇게 만들어서 어떤 타입이든 받아 그것을 파싱할 수있게 진행 하게 되었습니다. 


- 최종적으로는 이렇게 JSON 파일의 이름만을 받아함수 안에서 파싱을 진행한후 뱉어내어 만드는것이 가장 좋은 방법이라 생각을 하게 되었습니다 하지만 이것을 Model로 파일분리을 하게 되면 `import UIKit` 이 필요로하기에 UI가 없는곳에서 `import UIKit` 써야하기에 어색할 수 있습니다 이점에 대해서는 리뷰어와 소통을 통해 진행 하도록 하겠습니다.
```swift!
extension JSONDecoder {
    func decodingContentInfo<T:Decodable>(_ name: String, modelType:T.Type) throws -> T {
        let name = NSDataAsset(name: name)
        let contentData = name?.data
        
        let decodedModel = try self.decode(T.self, from: contentData!)
        
        return decodedModel
    }
}
```

<br>

2️⃣ **VC간 데이터 전달**
-
🔒 **문제점**
- `ItemListViewController`에서 `DetailItemViewController`로 선택된 `cell`의 `Item`을 보내줘야 하는데 프로퍼티 또는 메소드에 직접 연결해 주입해주는 방법은 좋지 않다고 생각했습니다.

```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
        
    guard let detailItemViewController = storyboard?.instantiateViewController(identifier: "DetailItemViewController") else { return }
 
    detailItemViewController.setDetailItem(item)
    detailItemViewController.title = item.name
    
    tableView.deselectRow(at: indexPath, animated: true) 
    self.navigationController?.pushViewController(detailItemViewController, animated: true)
}
```


<br>

🔑 **해결방법**
- `DetailItemViewController`에서 `init`를 통해 인스턴스 생성시 주입해주는 방법으로 해결했습니다. 다만 스토리보드 이용시 `instantiateViewController(withIdentifier:)` 메소드로는 구현이 불가능하다고 해 검색해본 결과 iOS13 이후에 `instantiateViewController(identifier:, creator:)`이라는 메소드가 새로 나왔고 이걸 이용하면 스토리보드 이용시에도 custom init이 가능하다고하여 사용해 보았습니다.

```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
    let detailItemViewController = storyboard.instantiateViewController(identifier: "DetailItemViewController") { coder in DetailItemViewController(item: item, coder: coder) }
 
    tableView.deselectRow(at: indexPath, animated: true)
    self.navigationController?.pushViewController(detailItemViewController, animated: true)
}
```
<br>

## 📚 참고 링크

[스토리보드에서 custom initializer구현할때](https://developer.apple.com/documentation/uikit/uistoryboard/3213989-instantiateviewcontroller)


</br>

## 👥 팀 회고 - 추후 추가
- [팀 회고 링크]

# 팀 회고 - 추후 추가
## 우리팀이 잘한 점

## 서로에게 좋았던 점 피드백
- redmango to hamg

- hamg to redmango
    
## 서로에게 하고싶은 말
- redmango to hamg

- hamg to redmango

