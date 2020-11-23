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
    private lazy var controllerBase: UINavigationController = UINavigationController()
    private var viewControllerFactory: ViewControllerFactoryProtocol
    
    init(_ windowScene: UIWindowScene,
         viewControllerFactory: ViewControllerFactoryProtocol = ViewControllerFactoryImpl()) {
        self.window = UIWindow(windowScene: windowScene)
        self.viewControllerFactory = viewControllerFactory
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
            let viewController = viewControllerFactory.makeFavoriteListViewController(withRouter: self)
            controllerBase.pushViewController(viewController, animated: true)
            
        case .favoriteDetail(let identifier):
            let viewController = viewControllerFactory.makeFavoriteStockViewController(withIdentifier: identifier)
            controllerBase.pushViewController(viewController, animated: true)
        }
    }
}
