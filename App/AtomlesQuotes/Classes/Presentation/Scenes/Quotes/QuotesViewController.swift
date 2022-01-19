//
//  QuotesViewController.swift
//  AtomlesQuotes
//
//  Created by Ildar on 20.12.2021.
//

import UIKit

class QuotesViewController: UIViewController {

    // MARK: - Lifecycle
    override func loadView() {
        view = QuotesView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeOnCustomViewActions()
        setupNavigationItem()
        presenter?.onViewDidLoad()
    }
    
    // MARK: - Properties
    lazy var customView = view as! QuotesView

    var presenter: QuotesPresenter?
    
    var coordinator: QuotesCoordinator?
    
    // MARK: - Methods
    func subscribeOnCustomViewActions() {
        customView.didPressRefreshButton = { [unowned self] in
            presenter?.refresh()
        }
    }
    
    func setupNavigationItem() {
        navigationItem.title = "AtomlesQuotes"
    }
}

// MARK: - View Protocol
extension QuotesViewController: QuotesViewProtocol {
    
    func setCharacterImage(with image: UIImage) {
        customView.characterImageView.image = image
    }
    
    func setQuoteText(with text: String) {
        customView.quoteLabel.text = "«\(text)»"
    }
    
    func setCopyrightName(with name: String) {
        customView.copyrightLabel.text = "© \(name)"
    }
    
    func startRefresh() {
        customView.refreshButton.isHidden = true
        customView.activityIndicator.startAnimating()
    }
    
    func stopRefresh() {
        customView.refreshButton.isHidden = false
        customView.activityIndicator.stopAnimating()
    }
}
