//
//  AppCoordinator.swift
//  AtomlesQuotes
//
//  Created by Ildar on 20.12.2021.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let quotesCoordinator = QuotesCoordinator(navigationController: navigationController)
        coordinate(to: quotesCoordinator)
    }
}
