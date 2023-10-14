//
//  FavoriteStockDetailUseCaseProtocol.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol FavoriteStockDetailUseCaseProtocol {
    func fetch(withIdentifier identifier: String,
               _ completion: @escaping (Result<Stock, NNError>) -> Void)
}
