//
//  ChallengeAPIServiceTests.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import XCTest
@testable import NinetyNineChallenge

final class ChallengeAPIServiceTests: XCTestCase {
    func test_retrieveFavoriteStocksList_correctResult() {
        let expectation = XCTestExpectation(description: "Data downloaded successfully")
        let sut = makeSUT()
        sut.fetchFavoriteStocksList { result in
            switch result {
            case .success(let list) where !list.result.isEmpty:
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func test_retrieveFavoriteStocksList_wrongResult() {
        let expectation = XCTestExpectation(description: "API error handled successfully")
        let sut = makeSUT(withTestURLs: Self.provideWrongURLs())
        sut.fetchFavoriteStocksList { result in
            switch result {
            case .failure(_):
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func test_retrieveStockDetail_correctResult() {
        let expectation = XCTestExpectation(description: "Data downloaded successfully")
        let sut = makeSUT()
        sut.fetchfavoriteStockDetail(withIdentifier: "123") { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func test_retrieveStockDetail_wrongResult() {
        let expectation = XCTestExpectation(description: "API error handled successfully")
        let sut = makeSUT(withTestURLs: Self.provideWrongURLs())
        sut.fetchfavoriteStockDetail(withIdentifier: "456") { result in
            switch result {
            case .failure(_):
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        
        wait(for: [expectation], timeout: 3)
    }
}

private extension ChallengeAPIServiceTests {
    static var requestBuilder: RequestBuilderImpl {
        RequestBuilderImpl(urlBase: ChallengeAPICredentials().urlBase)
    }
    
    func makeSUT(withTestURLs urls: [String: Data] = provideCorrectURLs()) -> ChallengeAPIService {
        // Mock URLSession protocol to intercept requests and avoid internet connection dependency
        MockURLProtocol.testURLs = urls
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        let session = URLSession(configuration: config)
        let urlSessionEngine = URLSessionRequestEngineImpl(session: session)
        return ChallengeAPIService(requestEngine: urlSessionEngine)
    }
    
    // URLs to test successfull connections
    static private func provideCorrectURLs() -> [String: Data] {
        let favoriteStocksListURL = try!
            requestBuilder
            .setEndpoint(ChallengeAPIEndpoint.favoriteStocksList)
            .build()
            .url!
        let favoriteStocksListResponseData = ResourceLoader.loadData(name: "favorite_stock_list_request_valid")!
        
        let favoriteStockDetailURL = try!
            requestBuilder
            .setEndpoint(ChallengeAPIEndpoint.favoriteStockDetail(identifier: "123"))
            .build()
            .url!
        let favoriteStockDetailResponseData = ResourceLoader.loadData(name: "favorite_stock_detail_valid")!
        
        return [favoriteStocksListURL.path: favoriteStocksListResponseData,
                favoriteStockDetailURL.path: favoriteStockDetailResponseData]
    }
    
    // URLs to test failure connections
    static private func provideWrongURLs() -> [String: Data] {
        let favoriteStocksListURL = try!
            requestBuilder
            .setEndpoint(ChallengeAPIEndpoint.favoriteStocksList)
            .build()
            .url!
        let favoriteStocksListResponseData = ResourceLoader.loadData(name: "favorite_stock_list_request_invalid")!
        
        let favoriteStockDetailURL = try!
            requestBuilder
            .setEndpoint(ChallengeAPIEndpoint.favoriteStockDetail(identifier: ""))
            .build()
            .url!
        let favoriteStockDetailResponseData = ResourceLoader.loadData(name: "favorite_stock_detail_invalid")!
        
        return [favoriteStocksListURL.path: favoriteStocksListResponseData,
                favoriteStockDetailURL.path: favoriteStockDetailResponseData]
    }
}
