//
//  AppRouter.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

// MARK: Router protocol
protocol RouterProtocol: class {
    func start()
    func show(module destination: AppTarget)
}

// MARK: Application targets
enum AppTarget {
    case favoriteList
    case favoriteDetail(String)
}

final class AppRouter: RouterProtocol {
    private(set) var window: UIWindow
    private var controllerBase: UINavigationController
    
    init(_ windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        self.controllerBase = UINavigationController()
    }
    
    func start() {
        loadTheme()
        window.rootViewController = controllerBase
        window.makeKeyAndVisible()
        show(module: .favoriteList)
    }
    
    func show(module destination: AppTarget) {
        switch destination {
        case .favoriteList:
            let viewController = FavoriteListViewController(viewModel: FavoriteListViewModelImpl(router: self))
            controllerBase.pushViewController(viewController, animated: true)
        case .favoriteDetail(let identifier):
            let viewController = FavoriteStockDetailViewController(viewModel: FavoriteStockDetailViewModelImpl(identifier: identifier))
            controllerBase.pushViewController(viewController, animated: true)
        }
    }
}
