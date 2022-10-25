## 목차

#### 1. [👥 팀원](#1.-팀원)
#### 2. [🌏 프로젝트 소개](#2.-프로젝트-소개)
#### 3. [🏞 구현 내용](#3.-구현-내용)
#### 4. [🔥 고민한 점](#4.-고민한-점)
--- 
# 1. 팀원 👥

| <center> Jeremy | <center> 준호 |
| -------- | ---------|
| <a href="https://ibb.co/K6tWhrT"><img src="https://i.imgur.com/RbVTB47.jpg" border="0" width="200"></a>  | <img src="https://user-images.githubusercontent.com/88357373/197145292-c806a131-bd9d-47ca-8b2a-8842f748f63f.png" width="200"/>
  | <center>[*@yjjem*](https://github.com/yjjem)</center> |[<center>*@junho15*](https://github.com/junho15) </center> |
---
  
# 2. 프로젝트 소개
* 만국박람회의 정보와 출품작 정보를 조회하는 앱입니다.
    
# 3. 구현 내용
* 첫 번째 화면은 스크롤 뷰와 스택 뷰를 활용해서 만들었습니다.
* 두 번째 화면으로 이동은 segue를 활용했습니다.
* 두 번째 화면은 테이블 뷰를 활용해서 만들었습니다.
* 세 번째 화면으로 이동은 NavigationController를 활용했습니다.
* 세 번째 화면은 스택 뷰를 활용해서 만들었습니다

<center>
    <div style="display: flex; flex-direction: row; justify-cotents: center;">
        <img src="https://i.imgur.com/ja53aMa.jpg" width="200px"/>
        <img src="https://i.imgur.com/668cK11.jpg" width="200px"/>
        <img src="https://i.imgur.com/reqRHGC.png" width="200px"/>
    </div>
</center>
    
# 4. 고민한 점
* 첫 번째 화면과 두 번째 화면에서 JSONDecoder를 사용하는 코드가 비슷했습니다. 중복을 줄이기 위해서 JSONDecoder을 extension하여 decode 메서드를 추가했습니다. 제네릭 타입을 사용해서 두 화면 모두에서 사용할 수 있도록 했습니다.
    ```swift
    extension JSONDecoder {

        func decode<T: Decodable>(from fileName: String, to: T) -> T? {
            guard let dataAsset: NSDataAsset = NSDataAsset(name: fileName) else { return nil }
            do {
                return try self.decode(T.self, from: dataAsset.data)
            } catch {
                return nil
            }
        }
    }
    ```
* Custom Cell을 사용하지 않고 기본 셀로 구현중에 왼쪽 그림과 같이 imageView에 constraints가 잡히지 않는 점이 고민이였습니다. AutoLayout 관련 문제들은 Step3에서 진행한다고 해서 아직 깊게 고민하지는 않았습니다. 임시방편으로 가독성을 위해 heightForRowAt을 사용하여 오른쪽의 그림과 같이 cell의 크기를 잡아주었습니다.


<div style="display: flex; flex-direction: row;">
    <img src="https://i.imgur.com/g3445A1.jpg" width="300px"/>
    <img src="https://i.imgur.com/J771rfn.jpg" width="300px"/>
</div>


