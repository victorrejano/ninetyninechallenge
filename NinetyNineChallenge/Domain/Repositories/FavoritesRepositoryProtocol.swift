//
//  FavoritesRepositoryProtocol.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol FavoritesRepositoryProtocol: class {
    func fetchFavoriteStock(withIdentifier identifier: String,
                            _ completion: @escaping (Result<Stock, NNError>) -> Void)
    func fetchFavoriteStocks(_ completion: @escaping (Result<FavoriteStocks, NNError>) -> Void)
}
