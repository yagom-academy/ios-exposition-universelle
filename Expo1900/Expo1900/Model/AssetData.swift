//
//  AssetData.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/19.
//

enum AssetData {
    static func assignParisExpo() throws -> ParisExpo {
        return try ParserManager<ParisExpo>.parse(fileName: FileName.parisExpo)
    }
    
    static func assignKoreanItems() throws -> [KoreanHistoricalItem] {
        return try ParserManager<[KoreanHistoricalItem]>.parse(fileName: FileName.items)
    }
}
