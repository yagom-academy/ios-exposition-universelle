//
//  DecodeTests.swift
//  DecodeTests
//
//  Created by Taeangel, dudu on 2022/04/11.
//

import XCTest
@testable import Expo1900

class DecodeTests: XCTestCase {
  //asseName이 준비됬을때, ParseManager<Expo>.parse를 수행하면
  //결과가 nil이 아니여야 한다
  func test_assetName이_준비됐을때_Expo타입의_PaseManager_parse의_결과가_Nil이_아니여야한다() {
    //given
    let assetName = "exposition_universelle_1900"
    //when
    let result = ParseManager<Expo>.parse(name: assetName)
    //then
    XCTAssertNotNil(result)
  }
  
  func test_assetName이_준비됐을때_Heritage타입의_PaseManager_parse의_결과가_Nil이_아니여야한다() {
    //given
    let assetName = "items"
    //when
    let result = ParseManager<[Heritage]>.parse(name: assetName)
    //then
    XCTAssertNotNil(result)
  }
}
