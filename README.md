## 만국박람회 프로젝트 저장소

## [Step 01] 

# 배경 
> JSON 포멧의 데이터와 매칭할 모델 타입을 구현

- Contents.json
```json
{
  "images" : [
    {
      "filename" : "bangjja~universal@1x.png",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "filename" : "bangjja~universal@2x.png",
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "filename" : "bangjja~universal@3x.png",
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
```
- items.json 

```json
[
	{
		"name":"직지심체요절",
		"image_name":"jikji",
		"short_desc":"백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
		"desc":"《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년에 초록한 불교 서적이다. 간단히 직지심체요절(直指心體要節) 또는 직지(直指, JUKJI)라고 부르기도 한다.\n\n1372년(공민왕 21)에 백운화상 경한이 임제종 18대 법손 석옥청공(石屋淸珙) 화상(和尙)으로부터 받아 온 《불조직지심체요절》을 증보하여 상·하 2권으로 엮은 것이다. 백운화상이 입적하고 3년 뒤인 1377년에 청주 흥덕사(興德寺)에서 금속활자로 찍어 낸 것이 초인본(初印本)이다. 이는 현존하는 금속활자로 인쇄된 책 중 가장 오래된 것이다. 금속활자본은 현재 하권만이 전해지고, 프랑스 국립도서관에 소장되어 있다. 고간본(古刊本)으로는 1378년 백운화상이 입적한 여주 취암사(鷲巖寺)에서 간행한 목판본이 있다. 목판본은 1992년 4월 20일 보물 제1132호로 지정되었고, 현재 한국학중앙연구원 장서각과 국립중앙도서관에 상하권 1책이 각각 소장되어 있다.\n\n중심 주제인 직지심체(直指心體)는 ‘직지인심견성성불(直指人心見性成佛)’이라는 오도(悟道)의 명구에서 따온 것이다. 그 뜻은 사람이 마음을 바르게 가졌을 때 그 심성이 곧 부처의 마음임을 깨닫게 된다는 뜻이다. 사람의 본성은 그 자체가 본시 청정하므로 선지식(善知識)의 도움에 의하여 자기 마음 속에서 그 심성이 자정(自淨)함을 깨닫고 늘 자수(自修)·자행(自行)하면 곧 불성(佛性)을 체득하여 자기 자신이 바로 법신(法身)이 되며, 자기 마음이 바로 불심이 된다는 요지이다.\n\n정식 명칭은 ‘백운화상초록불조직지심체요절’(白雲和尙抄錄佛祖直指心體要節)이며, 간략 서명은 ‘불조직지심체’(佛祖直指心體)이다. 판심제(版心題)는 직지(直指) 또는 심요(心要)이다. 간단히 '직지심체요절(直指心體要節)', '직지(直指)'로 불리며, 영어권에도 'Jikji'로 통용된다.\n\n흔히 직지심경(直指心經)으로도 불리는데, 불서(佛書) 중 직지는 경(經)이 아니라 요절(要節)이기 때문에 이는 잘못된 표현이다."
	},
```

# 작업내용

1. Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현

2. 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
```swift=
extension EntryEntity {
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description
    }
}
```
- CodingKey 타입을 채택한 enum을 사용하여 JSON 키 값에 대칭

# 리뷰 노트 

1. Json 파일을 서버를 통해 파싱 받는 것이 아니라 strings file로 json 파일을 생성하여 파싱하는 방식일까요?/ 파일들 디렉토리를 프로젝트 내에 넣어서 경로를 읽어오는 방식일까요? 

2. Content.json 파일을 파싱할 필요가 있을까요? image 파일들을 Assets에 넣고 해당 이름들을 ImageView에 올리기만 하면 되는 것 아닌가요? 

## [Step 02]
# 코드 리뷰 (작업 단위 피드백)

## 배경

### 메인화면
> ExpositionPost  Json 파일 의 데이터들을 위해 ExpositionPostEntity 타입을 생성하여 데이터로 받아주었고 두개의 StackView 통해서 보여주었습니다


### 한국 출품작 리스트
> EntryEntity Json 파일의 데이터들을 위해 EntryEntity 타입을 생성하여 배열로 데이터를 받아주었고 해당 부분을 TableView를 통해서 리스트를 보여주었습니다.  

### 상세화면 
> 이전 TableView에서 Json 파일로 불러온 데이터를 넘겨 받아서 해당 작품의 내용을 보여줍니다.

## 작업 내용

### 메인화면
- ExpositionPostView.swift를 만들어 Custom UI를 코드로 구현하였습니다.
- Json 데이터 프로젝트 요구사항에 맞게 처리하였습니다
```swift
func manufacture(_ content: ExpositionPost) -> String {
        switch content {
        case .title:
            let content = title.split(separator: "(").map{ String($0) }
            let result = content[0] + "\n(" + content[1]
            return result
        case .visitors:
            return "방문객 : \(visitors.setNumberFormatter()) 명"
        case .location:
            return "개최지 : \(location)"
        case .duration:
            return "개최 기간 : \(duration)"
        case .description:
            return description
        }
    }
```
- 메인화면에 나타낼 Json 데이터 파싱 및 데이터 뷰에 할당
```swift
    private func configureUI() {
        guard let expositionPostEntity = try? JsonParser<ExpositionPostEntity>.fetch("ExpositionPost") 
        else { return }expositionPostView = ExpositionPostView(self, data:expositionPostEntity)
        self.navigationController?.navigationBar.isHidden = true
    }
```

### 한국 출품작 리스트
- ExpositionTableViewCell.swift를 만들어 Custom UI를 코드로 구현하였습니다. 

- 재사용되는 Cell의 프로퍼티들 초기화
```swift
    override func prepareForReuse() {
        super.prepareForReuse()
        entryImage.image = nil
        titleLabel.text = nil
        shortDescription.text = nil
    }
```

- Interface Builder를 사용하지 않는 경우 init(coder:)는 관련이 없으므로 호출되지 않음. 보일러 플레이트이다
- 해당 내용은 초기화시 제외되도록 설정
```swift
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
```    

- tableView의 높이가 내용에 맞게 커지도록 하는 설정
```swift
    expositionTableView.estimatedRowHeight = 100
    expositionTableView.rowHeight = UITableView.automaticDimension
```

- JSON Error
    - 메세지에 대한 부분은 사용하지 않고 있지만 추후 처리를 위해 생성하였습니다.
```swift
    enum JsonError: Error {
    case decodingFailure 
    }

    extension JsonError {
    var message: String {
        switch self {
        case .decodingFailure:
            return "JSON파일 디코딩을 실패했습니다.!"
        }
    }
    }

```

### 상세화면 

- 이전 페이지인 TableView에서 Row를 선택시 상세 화면의 entryEntity 프로퍼티로 Data를 넘깁니다. 
```swift
    var entryEntity: EntryEntity?
```

## 테스트 방법
- 서로 다른 시뮬레이터로 앱 실행시에 Autolayout이 잡히는지 확인합니다.


## 리뷰 노트
1. 메인화면에서 뷰의 마지막 부분인 버튼과 이미지들이 있는 뷰에서 이미지를 안쪽으로 넣기 위해서 빈 스택뷰를 바깥쪽(왼쪽/오른쪽)에 추가하였는데 이런 방법도 괜찮은 방법일까요?

2. 각 파일을 폴더별로 구분하여 두기 위해 고민하였고 Support file들을 Application과 Resources를 통해 구분하였습니다. 

3. 스택뷰 안에 존재하는 UIElement들도 저희가 한것처럼 top, bottom, leading, trailing을 지정하는 것이 맞을까요? 불필요한 부분들을 많이 설정한 것은 아닌가요? 

4. Main 스토리 보드를 제거하고 메인화면부터 뷰를 띄우는데요!. 화면을 .white로 설정하지 않으면 black 컬러로 화면이 설정됩니다. 해서 white로 화면 컬러를 지정해주니 status 바의 컬러가 white컬러로 남아있는 상황입니다. 어떻게 하면 될까요?

5. TableView를 코드로 작성해본 후 CollectionView를 통해서 list를 만들어볼 생각입니다. 시도해봐도 괜찮을까요?

6. 아직 Dynamic Types에 대한 공부를 하지 못하여 해당 부분에 대한 설정이 되어있지 않습니다.

## 스크린샷
    
|메인화면|한국 출품작 리스트|상세화면|
|:-:|:-:|:-:|
|<img src="https://i.imgur.com/JPkvrrN.gif">|<img src="https://i.imgur.com/DCCZnyb.gif">|<img src="https://i.imgur.com/GbtxcYz.gif">|
|메인화면입니다 <br> "한국의 출품작 보러가기"<br>버튼 클릭시 다음화면으로 넘어 갑니다.| 한국의 출품작을 <br> 리스트로 나타내고 있습니다.<br> 작품 리스트 클릭시 상세보기 화면으로 전환 됩니다.|각 출품작의 <br>이미지와 상세설명이 있습니다.<br> 작품 설명 길이에 따라 스크롤 가능합니다|!


## 이번 프로젝트 핵심경험 안내

- [X] Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [X] 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- [X] 테이블뷰의 Delegate와 Data Source의 역할의 이해
- [X] 테이블뷰의 셀의 재사용 이해
- [X] 테이블뷰의 전반적인 동작 방식의 이해
- [X] 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- [X] 내비게이션 컨트롤러를 활용한 화면 전환
- [X] 뷰 컨트롤러 사이의 데이터 전달
- [X] Codable을 채택하여 JSON 데이터와 매칭할 모델 타입 구현
- [X] 스네이크 케이스 또는 축약형인 JSON 키 값을 스위프트의 네이밍에 맞게 변환
- [X] 테이블뷰의 Delegate와 Data Source의 역할의 이해
- [X] 테이블뷰의 셀의 재사용 이해
- [X] 테이블뷰의 전반적인 동작 방식의 이해
- [X] 주어진 JSON 데이터를 파싱하여 테이블뷰에 표시
- [X] 내비게이션 컨트롤러를 활용한 화면 전환
- [X] 뷰 컨트롤러 사이의 데이터 전달
- [X] 오토 레이아웃을 적용하여 다양한 기기에 대응
- [ ] Word Wrapping / Line Wrapping / Line Break 방식의 이해
- [ ] 접근성(Accessibility)의 개념과 필요성 이해
- [ ] Dynamic Types를 통해 텍스트 접근성 향상
