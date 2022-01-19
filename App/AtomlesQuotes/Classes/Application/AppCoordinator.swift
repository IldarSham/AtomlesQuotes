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
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let quotesCoordinator = QuotesCoordinatorImplementation(navigationController: navigationController)
        coordinate(to: quotesCoordinator)
    }
}
