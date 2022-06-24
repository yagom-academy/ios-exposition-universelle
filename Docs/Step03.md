## 3️⃣ STEP 3
### STEP 3 Questions
### 1. Dynamic Type를 적용하면서  image View도 적용해야 할지 고민을 했습니다.
- Dynamic Type에 대해 찾아보니 image View도 Dynamic Type를 적용할 수 있다는 걸 알고 어떻게 적용을 할지 고민을 했습니다.
- 결론적으론 `Label과 Image View 모두 확대가 되는 것보다는 label이 확대되는 게 좋다`고 생각해서 image View는 적용하지 않는 방법으로 결정했습니다.
-  `이 부분에 대해 라이언은 어떻게 생각하시나요?`
### 2. 길이가 긴 Label의 경우 VoiceOver 작동에 문제가 있었습니다.
- 첫 번째 화면의 description Label은 Voice Over 기능이 정상적으로 작동하지 않았습니다. 그 이유를 저희는 Text의 길이가 굉장히 길어서 문제가 된다고 생각했습니다.
- 세 번째 화면의 description Label은는 길이가 길지만, 정상적으로 작동하는 걸 확인했습니다. 
- 이 부분에 대해 어떤 기준으로 Voice Over를 지원하고 지원하지 않는지 찾아보려고 했으나, 답을 찾지 못했습니다.
- 해결을 위한 시도
    - Value에 Text를 넣어서 확인했지만, 작동하지 않았습니다.
    - accessibility Label을 간략하게 "파리 만국박람회 설명" 이라는 Text로 정해주고 실행하니 작동시킬 수 있었습니다.
- 궁금한 점
    - 저희가 선택한 방법처럼 간단히 설명하는 방법 이외에 더 좋은 방법이 있을 거라고 생각합니다! 라이언은 이렇게 긴 Text는 어떤 방법으로 accessibility Label을 설정하시는지 궁금합니다.
    
### 3.  Line Wrapping
- 요구사항 중 초기화면 `title`에서 `(` 기준으로 줄바꿈이 필요한 상황이 있었습니다. 그래서 json 형식 데이터는 `\n`을 추가해주면 줄바꿈이 되는데 이렇게 원본 데이터를 바꿔서 사용해도 되는건지 라이언의 의견이 궁금합니다.

- 아래 코드는 라벨에 데이터를 넣기 전 `(`을 `\n`으로 변환해주는 코드 입니다.
```swift
        titleLabel.text = expoData?.title.replacingOccurrences(of: "(", with: "\n(")
``` 
---
### STEP 3 Answers
---
### STEP 3 Debugging
#### 두 번째 화면의 가로모드에서 테이블뷰의 cell이 노치를 침범하는 문제
- 문제해결을 위한 시도 1
    - TableView Controller의 self.view의 Trailing.safeLayoutGuide와 TableView의 Trailing을 동일하게 설정했으나 문제해결 실패.
        - 실패이유 파악
            - TableView Controller는 기본 View가 TableView 이기 때문에 자체 뷰의 간격을 줄 수 없을거라고 생각이 들었다.
- 문제해결을 위한 시도 2
    - TableView Controller을 사용하는 방법에서 UIView Controller를 사용하고 Table View Delegate, Table View Data source를 채택하는 방법으로 수정
    - UIView Controller의 View에 Table View를 추가하고, Trailing을 설정하는 방법으로 해결.
    
| **수정 전** | 
| :--------: |
| <image src = "https://i.imgur.com/kmjHfqm.png" width="600" height="250">|
| **수정 후** |
| <image src = "https://i.imgur.com/b1ZEix8.png" width="600" height="250">|

---
### STEP 3 Concepts
- Word Wrapping / Line Wrapping / Line Break
- Accessibility
- Dynamic Types
---
### STEP 3 Reviews
---
### STEP 3 Updates
