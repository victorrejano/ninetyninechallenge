//
//  ViewControllerFactory.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

// MARK: View controller factory protocol
protocol ViewControllerFactoryProtocol {
    func makeFavoriteListViewController(withRouter router: RouterProtocol) -> UIViewController
    func makeFavoriteStockViewController(withIdentifier identifier: String) -> UIViewController
}

// MARK: View controller factory implementation
struct ViewControllerFactoryImpl: ViewControllerFactoryProtocol {
    func makeFavoriteListViewController(withRouter router: RouterProtocol) -> UIViewController {
        return FavoriteListViewController(viewModel: FavoriteListViewModelImpl(router: router))
    }
    
    func makeFavoriteStockViewController(withIdentifier identifier: String) -> UIViewController {
        return FavoriteStockDetailViewController(viewModel: FavoriteStockDetailViewModelImpl(identifier: identifier))
    }
}
