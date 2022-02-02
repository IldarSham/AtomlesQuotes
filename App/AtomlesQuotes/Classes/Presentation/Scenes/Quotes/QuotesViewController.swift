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
        presenter?.onViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupNavigationItem()
    }
    
    // MARK: - Properties
    lazy var customView = view as! QuotesView

    var presenter: QuotesPresenter?
    
    var coordinator: QuotesFlow?
    
    // MARK: - Methods
    func subscribeOnCustomViewActions() {
        customView.didPressRefreshButton = { [unowned self] in
            presenter?.refresh()
        }
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

// MARK: - Setup UI
extension QuotesViewController {
    
    func setupNavigationBar() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    func setupNavigationItem() {
        self.navigationItem.title = "AtomlesQuotes"
    }
}
