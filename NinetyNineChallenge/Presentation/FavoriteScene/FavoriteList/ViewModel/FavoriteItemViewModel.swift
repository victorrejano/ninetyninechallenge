//
//  FavoriteItemViewModel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol FavoriteItemViewModelProtocol {
    var title: String { get }
}

struct FavoriteItemViewModelImpl: FavoriteItemViewModelProtocol {
    let title: String
    
    init(with favoriteStock: String) {
        self.title = favoriteStock
    }
}
