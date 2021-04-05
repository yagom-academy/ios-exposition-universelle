//
//  JSONString.swift
//  exposition-universelle
//
//  Created by 강경 on 2021/04/06.
//

import Foundation

// MARK: - 디코딩할 jsonString
// command-line 테스트용
let jsonString = """
{
    "catalog":
    [
        {
            "name": "test1",
            "picture": "출품작 사진",
            "summary": "출품작 간단 설명",
            "details": "test1의 출품작 상세 설명입니다. 이러쿵~ 저러쿵쿵~~"
        },
        {
            "name": "test2",
            "picture": "test2 사진",
            "summary": "test2 간단 설명",
            "details": "test2의 출품작 상세 설명입니다. 이러쿵~ 저러쿵쿵~~"
        },
        {
            "name": "test3",
            "picture": "test3 사진",
            "summary": "test3 간단 설명",
            "details": "test3의 출품작 상세 설명입니다. 이러쿵~ 저러쿵쿵~~"
        }
    ]
}
"""
