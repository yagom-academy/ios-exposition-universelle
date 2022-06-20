//
//  JsonDataDecoding.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import Foundation

func loadJsonData<T: Decodable>(type: T.Type ,_ fileName: String, _ extensionName: String) -> T {
    let jsonDecoder = JSONDecoder()
    let fileUrl = loadFileLocation(fileName, extensionName)
    do {
        let data = try Data(contentsOf: fileUrl)
        let decodedData = try jsonDecoder.decode(type.self, from: data)
        return decodedData
    } catch {
        fatalError("JSON DATA LOAD ERROR: \(fileName),\(extensionName)")
    }
}

private func loadFileLocation(_ fileName: String, _ extensionName: String) -> URL {
    guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: extensionName) else {
        return URL(fileURLWithPath: "")
    }
    return fileLocation
}
