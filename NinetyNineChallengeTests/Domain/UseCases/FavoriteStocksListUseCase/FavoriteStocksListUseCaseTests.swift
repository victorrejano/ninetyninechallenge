//
//  FavoriteStocksListUseCaseTests.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import XCTest
@testable import NinetyNineChallenge

final class FavoriteStocksListUseCaseTests: XCTestCase {
    func test_fetchFavoriteStocksList_correctResult() {
        let sut = makeSUT(numberOfStocks: 10)
        let expectation = XCTestExpectation(description: "Results handled correctly")
        
        sut.fetch { result in
            switch result {
            case .success(let data) where !data.isEmpty:
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func test_fetchFavoriteStocksList_wrongResult() {
        let sut = makeSUT(numberOfStocks: 0)
        let expectation = XCTestExpectation(description: "Error retrieving data handled correctly")
        
        sut.fetch { result in
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

private extension FavoriteStocksListUseCaseTests {
    func makeSUT(numberOfStocks: Int = Int.random(in: 1...20)) -> FavoriteStocksListUseCaseImpl {
        let stocks = MockEntitiesGenerator.createFavoriteStocksList(amount: numberOfStocks)
        return FavoriteStocksListUseCaseImpl(repository:
                                                MockFavoritesRepository(withFavorites: stocks))
    }
}
