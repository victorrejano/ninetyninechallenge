//
//  StockDTOTests.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import XCTest
@testable import NinetyNineChallenge

final class StockDTOTests: XCTestCase {
    func test_loadStockDTO_fromJSON_isCorrect() {
        let sut = ResourceLoader.load(type: StockDTO.self, name: "stock_dto")
        XCTAssertNotNil(sut)
    }
}
