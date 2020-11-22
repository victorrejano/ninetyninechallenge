//
//  FavoriteListDTOTests.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import XCTest
@testable import NinetyNineChallenge

final class FavoriteListDTOTests: XCTestCase {
    func test_loadFavoriteListDTO_fromJSON_isCorrect() {
        let sut = ResourceLoader.load(type: FavoriteListDTO.self, name: "favorite_list_dto")
        XCTAssertNotNil(sut)
    }
    
    func test_mappingFavoriteListDTO_toFavoriteStocks_isCorrect() {
        let sut = ResourceLoader.load(type: FavoriteListDTO.self, name: "favorite_list_dto")
        XCTAssertNotNil(sut)
        
        let domainEntity = sut?.toDomain()
        XCTAssertEqual(sut?.result, domainEntity)
    }
}
