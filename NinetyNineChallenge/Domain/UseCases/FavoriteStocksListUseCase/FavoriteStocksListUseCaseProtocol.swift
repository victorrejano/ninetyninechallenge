//
//  FavoriteStocksListUseCaseProtocol.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol FavoriteStocksListUseCaseProtocol: AnyObject {
    func fetch(_ completion: @escaping (Result<FavoriteStocks, NNError>) -> Void)
}
