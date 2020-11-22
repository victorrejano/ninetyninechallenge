//
//  FavoriteStockDetailUseCaseTests.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import XCTest
@testable import NinetyNineChallenge

final class FavoriteStockDetailUseCaseTests: XCTestCase {
    func test_fetchFavoriteStockById_correctResult() {
        let sut = makeSUT(withoutData: false)
        let expectation = XCTestExpectation(description: "Results handled correctly")
        
        sut.fetch(withIdentifier: "123") { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_fetchFavoriteStockById_wrongResult() {
        let sut = makeSUT()
        let expectation = XCTestExpectation(description: "Error retrieving data handled correctly")
        
        sut.fetch(withIdentifier: "") { result in
            switch result {
            case .failure(_):
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}

extension FavoriteStockDetailUseCaseTests {
    func makeSUT(withoutData: Bool = true) -> FavoriteStockDetailUseCaseImpl {
        return FavoriteStockDetailUseCaseImpl(repository:
                                                MockFavoritesRepository(withStock: withoutData ?
                                                                            nil :
                                                                            MockEntitiesGenerator.createStock()))
    }
}
