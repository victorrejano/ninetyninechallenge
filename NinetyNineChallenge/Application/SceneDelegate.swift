//
//  SceneDelegate.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var router: RouterProtocol?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        router = AppRouter(windowScene)
        router?.start()
    }
}
