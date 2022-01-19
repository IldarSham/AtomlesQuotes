//
//  QuotesCoordinator.swift
//  AtomlesQuotes
//
//  Created by Ildar on 20.12.2021.
//

import Foundation
import UIKit

protocol QuotesCoordinator: AnyObject {}

class QuotesCoordinatorImplementation: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let quotesViewController = QuotesViewController()
        let quotesPresenter = QuotesPresenter(
            view: quotesViewController,
            quotesService: QuotesSerivceImplementation(),
            imageLoader: ImageLoaderImplementation()
        )
        quotesViewController.presenter = quotesPresenter
        
        navigationController.pushViewController(quotesViewController, animated: true)
    }
}

extension QuotesCoordinatorImplementation: QuotesCoordinator {}
