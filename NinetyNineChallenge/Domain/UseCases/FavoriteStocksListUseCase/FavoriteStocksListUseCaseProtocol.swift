//
//  FavoriteStocksListUseCaseProtocol.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol FavoriteStocksListUseCaseProtocol: class {
    func fetch(_ completion: @escaping (Result<FavoriteStocks, NNError>) -> Void)
}
