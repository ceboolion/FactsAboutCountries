//
//  SceneDelegate.swift
//  FactsAboutCountries
//
//  Created by Ceboolion on 16/05/2020.
//  Copyright © 2020 Ceboolion. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let rootVC = ViewController()
        let navigation = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

