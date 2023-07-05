//
//  ItemsModelTests.swift
//  ItemsModelTests
//
//  Created by MARY, KOBE on 2023/06/27.
//

import XCTest
@testable import Expo1900
final class ItemsModelTests: XCTestCase {
	func test_출품작목록json데이터를_parsing했을때_정보를추출한다() {
		// given
		guard let dataAsset = NSDataAsset(name: "items") else {
			return
		}
		let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
		let nameExpectation = "불경"
		let imageNameExpectation = "buddhism"
		let shortDescExpectation = "석가모니와 그 제자들의 가르침을 모아놓은, 불교의 경전"
		let descExpectation = "불경(佛經, 영어: Buddhist texts)은 석가모니와 그 제자들의 가르침을 모아놓은, 불교의 경전이다.\n\n중복되는 예도 많고 인도, 중국, 티베트, 한국을 거치면서 같은 경전이 여러가지 이름으로 불리기도 한다. 불교의 경전은 1차 결집은 석가모니의 말을 제자들이 다시 암송하는 것이었다. 즉 현재처럼 책으로 만들어진 것이 아니라, 같이 암송하여 석가모니의 말임을 확인하는 것이 결집이었다. 그 후 3차 결집에서는 패엽에 기록하였고 이후 경, 논, 율 의 3장 삼장으로 분류하여 각국에서 대장경을 결집하였다.\n\n현재 일본의 신수대장경이 가장 체계적인 정리이므로 불교 연구에서 대장경의 표준이다. 대한민국 해인사의 팔만대장경도 2004년 현재 전산화가 완료되었다.\n\n불교 경전은 상좌부 불교 계통인 아함경 등 상좌부 경전 / 대승불교의 대승경전 / 티베트 불교, 즉 밀교의 금강승 계통의 경전으로 나눌 수 있다. 밀교는 일반적으로 대승에 속한다."
		
		// when
		let items = try! decoder.decode([ItemsModel].self, from: dataAsset.data)
		
		// then
		XCTAssertEqual(items[1].name, nameExpectation)
		XCTAssertEqual(items[1].imageName, imageNameExpectation)
		XCTAssertEqual(items[1].shortDesc, shortDescExpectation)
		XCTAssertEqual(items[1].desc, descExpectation)
	}

}
