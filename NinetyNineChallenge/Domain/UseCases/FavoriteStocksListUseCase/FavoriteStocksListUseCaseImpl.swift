//
//  FavoriteStocksListUseCaseImpl.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

final class FavoriteStocksListUseCaseImpl: FavoriteStocksListUseCaseProtocol {
    private var repository: FavoritesRepositoryProtocol
    
    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetch(_ completion: @escaping (Result<FavoriteStocks, NNError>) -> Void) {
        repository.fetchFavoriteStocks(completion)
    }
}
