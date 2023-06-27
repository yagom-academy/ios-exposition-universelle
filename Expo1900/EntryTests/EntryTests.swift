//
//  EntryTests.swift
//  EntryTests
//
//  Created by Dasan & Moon on 2023/06/26.
//

import XCTest
@testable import Expo1900

final class EntryTests: XCTestCase {
    private var sut: [Entry]?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            self.sut = try decoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    private func test_sut의count는_13이다() {
        // given
        let expectation = 13
        // when
        guard let result = sut?.count else {
            print("count를 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertEqual(expectation, result)
    }
    
    private func test_sut의count인_13과_expectation인_12를_비교하면_같지않다() {
        // given
        let falseExpectation = 12
        // when
        guard let result = sut?.count else {
            print("count를 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertNotEqual(falseExpectation, result)
    }

    private func test_sut첫번째의_name은_직지심체요절이다() {
        // given
        let expectation = "직지심체요절"
        // when
        guard let result = sut?.first?.name else {
            print("name을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertEqual(expectation, result)
    }
    
    private func test_sut첫번째의_name인_직지심체요절과_직지를_비교하면_같지않다() {
        // given
        let falseExpectation = "직지"
        // when
        guard let result = sut?.first?.name else {
            print("name을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertNotEqual(falseExpectation, result)
    }
    
    private func test_sut마지막번째의_name은_거문고이다() {
        // given
        let expectation = "거문고"
        // when
        guard let result = sut?.last?.name else {
            print("name을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertEqual(expectation, result)
    }
    
    private func test_sut첫번째의_imageName은_json의image_name과같다() {
        // given
        let expectation = "jikji"
        // when
        guard let result = sut?.first?.imageName else {
            print("imageName을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertEqual(expectation, result)
    }
    
    private func test_sut첫번째의_imageName과_대문자인imageName은_같지않다() {
        // given
        let falseExpectation = "jikji".uppercased()
        // when
        guard let result = sut?.first?.imageName else {
            print("imageName을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertNotEqual(falseExpectation, result)
    }
    
    private func test_sut첫번째의_shortDescription은_json의short_desc과같다() {
        // given
        let expectation = "백운화상 경한(景閑)이 1372년에 초록한 불교 서적"
        // when
        guard let result = sut?.first?.shortDescription else {
            print("shortDescription을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertEqual(expectation, result)
    }
    
    private func test_sut첫번째의_shortDescription과_띄어쓰기를생략한_shortDescription은_같지않다() {
        // given
        let falseExpectation = "백운화상경한(景閑)이1372년에초록한불교서적"
        // when
        guard let result = sut?.first?.shortDescription else {
            print("shortDescription을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertNotEqual(falseExpectation, result)
    }
    
    private func test_sut첫번째의_description은_json의desc와같다() {
        // given
        let expectation = """
《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년에 초록한 불교 서적이다. 간단히 직지심체요절(直指心體要節) 또는 직지(直指, JUKJI)라고 부르기도 한다.\n\n1372년(공민왕 21)에 백운화상 경한이 임제종 18대 법손 석옥청공(石屋淸珙) 화상(和尙)으로부터 받아 온 《불조직지심체요절》을 증보하여 상·하 2권으로 엮은 것이다. 백운화상이 입적하고 3년 뒤인 1377년에 청주 흥덕사(興德寺)에서 금속활자로 찍어 낸 것이 초인본(初印本)이다. 이는 현존하는 금속활자로 인쇄된 책 중 가장 오래된 것이다. 금속활자본은 현재 하권만이 전해지고, 프랑스 국립도서관에 소장되어 있다. 고간본(古刊本)으로는 1378년 백운화상이 입적한 여주 취암사(鷲巖寺)에서 간행한 목판본이 있다. 목판본은 1992년 4월 20일 보물 제1132호로 지정되었고, 현재 한국학중앙연구원 장서각과 국립중앙도서관에 상하권 1책이 각각 소장되어 있다.\n\n중심 주제인 직지심체(直指心體)는 ‘직지인심견성성불(直指人心見性成佛)’이라는 오도(悟道)의 명구에서 따온 것이다. 그 뜻은 사람이 마음을 바르게 가졌을 때 그 심성이 곧 부처의 마음임을 깨닫게 된다는 뜻이다. 사람의 본성은 그 자체가 본시 청정하므로 선지식(善知識)의 도움에 의하여 자기 마음 속에서 그 심성이 자정(自淨)함을 깨닫고 늘 자수(自修)·자행(自行)하면 곧 불성(佛性)을 체득하여 자기 자신이 바로 법신(法身)이 되며, 자기 마음이 바로 불심이 된다는 요지이다.\n\n정식 명칭은 ‘백운화상초록불조직지심체요절’(白雲和尙抄錄佛祖直指心體要節)이며, 간략 서명은 ‘불조직지심체’(佛祖直指心體)이다. 판심제(版心題)는 직지(直指) 또는 심요(心要)이다. 간단히 '직지심체요절(直指心體要節)', '직지(直指)'로 불리며, 영어권에도 'Jikji'로 통용된다.\n\n흔히 직지심경(直指心經)으로도 불리는데, 불서(佛書) 중 직지는 경(經)이 아니라 요절(要節)이기 때문에 이는 잘못된 표현이다.
"""
        // when
        guard let result = sut?.first?.description else {
            print("description을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertEqual(expectation, result)
    }
    
    private func test_sut첫번째의_description과_이스케이프문자를삭제한_description은_같지않다() {
        // given
        let falseExpectation = """
《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년에 초록한 불교 서적이다. 간단히 직지심체요절(直指心體要節) 또는 직지(直指, JUKJI)라고 부르기도 한다.1372년(공민왕 21)에 백운화상 경한이 임제종 18대 법손 석옥청공(石屋淸珙) 화상(和尙)으로부터 받아 온 《불조직지심체요절》을 증보하여 상·하 2권으로 엮은 것이다. 백운화상이 입적하고 3년 뒤인 1377년에 청주 흥덕사(興德寺)에서 금속활자로 찍어 낸 것이 초인본(初印本)이다. 이는 현존하는 금속활자로 인쇄된 책 중 가장 오래된 것이다. 금속활자본은 현재 하권만이 전해지고, 프랑스 국립도서관에 소장되어 있다. 고간본(古刊本)으로는 1378년 백운화상이 입적한 여주 취암사(鷲巖寺)에서 간행한 목판본이 있다. 목판본은 1992년 4월 20일 보물 제1132호로 지정되었고, 현재 한국학중앙연구원 장서각과 국립중앙도서관에 상하권 1책이 각각 소장되어 있다.중심 주제인 직지심체(直指心體)는 ‘직지인심견성성불(直指人心見性成佛)’이라는 오도(悟道)의 명구에서 따온 것이다. 그 뜻은 사람이 마음을 바르게 가졌을 때 그 심성이 곧 부처의 마음임을 깨닫게 된다는 뜻이다. 사람의 본성은 그 자체가 본시 청정하므로 선지식(善知識)의 도움에 의하여 자기 마음 속에서 그 심성이 자정(自淨)함을 깨닫고 늘 자수(自修)·자행(自行)하면 곧 불성(佛性)을 체득하여 자기 자신이 바로 법신(法身)이 되며, 자기 마음이 바로 불심이 된다는 요지이다.정식 명칭은 ‘백운화상초록불조직지심체요절’(白雲和尙抄錄佛祖直指心體要節)이며, 간략 서명은 ‘불조직지심체’(佛祖直指心體)이다. 판심제(版心題)는 직지(直指) 또는 심요(心要)이다. 간단히 '직지심체요절(直指心體要節)', '직지(直指)'로 불리며, 영어권에도 'Jikji'로 통용된다.흔히 직지심경(直指心經)으로도 불리는데, 불서(佛書) 중 직지는 경(經)이 아니라 요절(要節)이기 때문에 이는 잘못된 표현이다.
"""
        // when
        guard let result = sut?.first?.description else {
            print("description을 얻을 수 없습니다")
            return
        }
        // then
        XCTAssertNotEqual(falseExpectation, result)
    }
}
