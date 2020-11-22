//
//  FavoriteStockDetailUseCaseImpl.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

final class FavoriteStockDetailUseCaseImpl: FavoriteStockDetailUseCaseProtocol {
    private var repository: FavoritesRepositoryProtocol
    
    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetch(withIdentifier identifier: String,
               _ completion: @escaping (Result<Stock, NNError>) -> Void) {
        repository.fetchFavoriteStock(withIdentifier: identifier,
                                      completion)
    }
}
