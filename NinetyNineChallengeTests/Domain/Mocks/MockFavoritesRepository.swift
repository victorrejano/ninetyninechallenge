//
//  MockFavoritesRepository.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation
@testable import NinetyNineChallenge

final class MockFavoritesRepository: FavoritesRepositoryProtocol {
    private var favorites: FavoriteStocks
    private var stock: Stock?
    
    init(withFavorites favorites: FavoriteStocks = [],
         withStock stock: Stock? = nil) {
        self.favorites = favorites
        self.stock = stock
    }
    
    func fetchFavoriteStock(withIdentifier identifier: String,
                            _ completion: @escaping (Result<Stock, NNError>) -> Void) {
        completion(stock != nil ?
                    .success(stock!) :
                    .failure(NNError.custom("Data not found")))
    }
    
    func fetchFavoriteStocks(_ completion: @escaping (Result<FavoriteStocks, NNError>) -> Void) {
        completion(!favorites.isEmpty ?
                    .success(favorites) :
                    .failure(NNError.custom("Data not found")))
    }
}
