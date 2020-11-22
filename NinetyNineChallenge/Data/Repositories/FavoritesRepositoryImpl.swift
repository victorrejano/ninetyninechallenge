//
//  FavoritesRepositoryImpl.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

final class FavoritesRepositoryImpl: FavoritesRepositoryProtocol {
    private lazy var service = ChallengeAPIService()
    
    func fetchFavoriteStock(withIdentifier identifier: String, _ completion: @escaping (Result<Stock, NNError>) -> Void) {
        service.fetchFavoriteStock(withIdentifier: identifier) { result in
            switch result {
            case .success(let data): completion(.success(data.toDomain()))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
    func fetchFavoriteStocks(_ completion: @escaping (Result<FavoriteStocks, NNError>) -> Void) {
        service.fetchFavoriteStocks { result in
            switch result {
            case .success(let data): completion(.success(data.toDomain()))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
