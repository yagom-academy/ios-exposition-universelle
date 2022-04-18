//
//  DecodeTests.swift
//  DecodeTests
//
//  Created by Taeangel, dudu on 2022/04/11.
//

import XCTest
@testable import Expo1900

class DecodeTests: XCTestCase {
  func test_assetName이_준비됐을때_Expo타입의_parse의_결과가_Nil이_아니여야한다() {
    //given
    let assetName = "exposition_universelle_1900"
    var data: Expo?
    //when
    Expo.parse(name: assetName) { result in
      data = try? result.get()
    }
    //then
    XCTAssertNotNil(data)
  }
  
  func test_assetName이_준비됐을때_Heritage타입의_parse의_결과가_Nil이_아니여야한다() {
    //given
    let assetName = "items"
    var data: [Heritage]?
    //when
    [Heritage].parse(name: assetName) { result in
      data = try? result.get()
    }
    //then
    XCTAssertNotNil(data)
  }
}
