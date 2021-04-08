# JSON 다루기

## 인코딩 - 줄바꿈하는 방법

```swift
struct Person: Codable {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var address: String?
}

let p = Person(firstName: "Ki", lastName: "o", birthDate: Date(timeIntervalSince1970: 1234567), address: "Seoul")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted // 줄바꿈 

do {
    let jsonData = try encoder.encode(p)

    if let jsonStr = String(data: jsonData, encoding: .utf8) {
        print(jsonStr)
    }
} catch {
    print(error)
}
```

출력화면 ⬇︎ 

![스크린샷 2021-04-09 오전 1 02 38](https://user-images.githubusercontent.com/65153742/114059391-48163800-98cf-11eb-9d93-ea614723cd83.png)

<br>

## 인코딩 - 스네이크 케이스로 인코딩

```swift
import Foundation

struct Person: Codable {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var address: String?
}

let p = Person(firstName: "Ki", lastName: "o", birthDate: Date(timeIntervalSince1970: 1234567), address: "Seoul")

let encoder = JSONEncoder()
encoder.keyEncodingStrategy = .convertToSnakeCase // snakeCase

do {
    let jsonData = try encoder.encode(p)

    if let jsonStr = String(data: jsonData, encoding: .utf8) {
        print(jsonStr)
    }
} catch {
    print(error)
}
```

출력화면 ⬇︎ 

![스크린샷 2021-04-09 오전 1 03 20](https://user-images.githubusercontent.com/65153742/114059488-61b77f80-98cf-11eb-8f92-8e778282f9be.png)

<br>

## 인코딩 - 날짜형식

```swift
import Foundation

struct Person: Codable {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var address: String?
}

let p = Person(firstName: "Ki", lastName: "o", birthDate: Date(timeIntervalSince1970: 1234567), address: "Seoul")

let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601
let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"

encoder.dateEncodingStrategy = .formatted(formatter)

do {
    let jsonData = try encoder.encode(p)

    if let jsonStr = String(data: jsonData, encoding: .utf8) {
        print(jsonStr)
    }
} catch {
    print(error)
}
```

출력화면 ⬇︎ 

![스크린샷 2021-04-09 오전 1 03 38](https://user-images.githubusercontent.com/65153742/114059538-6c721480-98cf-11eb-90cd-1bf0fced59d2.png)

<br>

## 디코딩 1 - JSON key의 이름이 같을 때

```swift
struct Person: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var address: String?
}

let jsonStr = """
{
"firstName" : "Ki",
"age" : 17,
"lastName" : "O",
"address" : "Seoul"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
    fatalError()
}

let decoder = JSONDecoder()

do {
    let p = try decoder.decode(Person.self, from: jsonData)
    dump(p)
} catch {
    print(error)
}
```

출력화면 ⬇︎ 

![스크린샷 2021-04-09 오전 1 03 59](https://user-images.githubusercontent.com/65153742/114059583-78f66d00-98cf-11eb-8fe0-f0023dcc339e.png)

<br>

## 디코딩 2 - JSON key가 스네이크 형식으로 작성되어 있을 때

```swift
struct Person: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var address: String?
}

let jsonStr = """
{
"first_name" : "Ki",
"age" : 17,
"last_name" : "O",
"address" : "Seoul"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
    fatalError()
}

let decoder = JSONDecoder()

decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    let p = try decoder.decode(Person.self, from: jsonData)
    dump(p)
} catch {
    print(error)
}
```

출력화면 ⬇︎ 

![스크린샷 2021-04-09 오전 1 04 24](https://user-images.githubusercontent.com/65153742/114059643-8875b600-98cf-11eb-8aa7-03ae40287613.png)
