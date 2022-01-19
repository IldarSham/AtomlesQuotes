//
//  QuotesPresenter.swift
//  AtomlesQuotes
//
//  Created by Ildar on 22.12.2021.
//

import Foundation

class QuotesPresenter {

    // MARK: - Properties
    weak var view: QuotesViewProtocol?
    
    private let quotesService: QuotesService
    private let imageLoader: ImageLoader
    
    // MARK: - Initialization
    init(view: QuotesViewProtocol, quotesService: QuotesService, imageLoader: ImageLoader) {
        self.view = view
        self.quotesService = quotesService
        self.imageLoader = imageLoader
    }
    
    // MARK: - Methods
    func loadRandomQuote() {
        quotesService.getQuotes(count: 8) { [weak self] (quotes, error) in
            self?.view?.stopRefresh()

            if let quotes = quotes {
                guard let quote = quotes.randomElement() else { return }
                self?.configureViews(with: quote)
            }
        }
    }
    
    func configureViews(with quote: QuotesResponse) {
        view?.setQuoteText(with: quote.quoteText)
        view?.setCopyrightName(with: quote.copyrightName)
        imageLoader.loadImageFrom(urlString: quote.characterImageUrl) { [weak self] image in
            guard let image = image else { return }
            self?.view?.setCharacterImage(with: image)
        }
    }
}

// MARK: - Presenter Protocol
extension QuotesPresenter: QuotesViewPresenterProtocol {
    
    func onViewDidLoad() {
        view?.startRefresh()
        loadRandomQuote()
    }
    
    func refresh() {
        loadRandomQuote()
    }
}
