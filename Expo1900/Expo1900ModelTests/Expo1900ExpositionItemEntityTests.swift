//
//  Expo1900ExpositionItemEntityTests.swift
//  Expo1900ModelTests
//
//  Created by Max, Whales on 2023/06/27.
//

import XCTest
@testable import Expo1900

final class Expo1900ExpositionItemEntityTests: XCTestCase {
    var sut: ExpositionItemEntity!

    override func setUpWithError() throws {
        guard let itemsData = NSDataAsset.init(name: "items") else {
            return
        }
        
        let decorder = JSONDecoder()
        sut = try decorder.decode([ExpositionItemEntity].self, from: itemsData.data).first
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_ExpositionItemData에서_json_파일_내용이_제대로_디코딩된다() {
        // given
        let mock = ExpositionItemEntity.init(name: "직지심체요절",
                                           imageName: "jikji",
                                           shortDescription: "백운화상 경한(景閑)이 1372년에 초록한 불교 서적",
                                           description: "《'백운화상초록불조직지심체요절》(白雲和尙抄錄佛祖直指心體要節)은 백운화상 경한(景閑)이 1372년에 초록한 불교 서적이다. 간단히 직지심체요절(直指心體要節) 또는 직지(直指, JUKJI)라고 부르기도 한다.\n\n1372년(공민왕 21)에 백운화상 경한이 임제종 18대 법손 석옥청공(石屋淸珙) 화상(和尙)으로부터 받아 온 《불조직지심체요절》을 증보하여 상·하 2권으로 엮은 것이다. 백운화상이 입적하고 3년 뒤인 1377년에 청주 흥덕사(興德寺)에서 금속활자로 찍어 낸 것이 초인본(初印本)이다. 이는 현존하는 금속활자로 인쇄된 책 중 가장 오래된 것이다. 금속활자본은 현재 하권만이 전해지고, 프랑스 국립도서관에 소장되어 있다. 고간본(古刊本)으로는 1378년 백운화상이 입적한 여주 취암사(鷲巖寺)에서 간행한 목판본이 있다. 목판본은 1992년 4월 20일 보물 제1132호로 지정되었고, 현재 한국학중앙연구원 장서각과 국립중앙도서관에 상하권 1책이 각각 소장되어 있다.\n\n중심 주제인 직지심체(直指心體)는 ‘직지인심견성성불(直指人心見性成佛)’이라는 오도(悟道)의 명구에서 따온 것이다. 그 뜻은 사람이 마음을 바르게 가졌을 때 그 심성이 곧 부처의 마음임을 깨닫게 된다는 뜻이다. 사람의 본성은 그 자체가 본시 청정하므로 선지식(善知識)의 도움에 의하여 자기 마음 속에서 그 심성이 자정(自淨)함을 깨닫고 늘 자수(自修)·자행(自行)하면 곧 불성(佛性)을 체득하여 자기 자신이 바로 법신(法身)이 되며, 자기 마음이 바로 불심이 된다는 요지이다.\n\n정식 명칭은 ‘백운화상초록불조직지심체요절’(白雲和尙抄錄佛祖直指心體要節)이며, 간략 서명은 ‘불조직지심체’(佛祖直指心體)이다. 판심제(版心題)는 직지(直指) 또는 심요(心要)이다. 간단히 '직지심체요절(直指心體要節)', '직지(直指)'로 불리며, 영어권에도 'Jikji'로 통용된다.\n\n흔히 직지심경(直指心經)으로도 불리는데, 불서(佛書) 중 직지는 경(經)이 아니라 요절(要節)이기 때문에 이는 잘못된 표현이다.")
        
        // when
        // then
        XCTAssertEqual(mock, sut)
    }
}

