//
//  QuotesContract.swift
//  AtomlesQuotes
//
//  Created by Ildar on 11.01.2022.
//

import UIKit

protocol QuotesViewProtocol: AnyObject {
    func setCharacterImage(with image: UIImage)
    func setQuoteText(with text: String)
    func setCopyrightName(with name: String)
    func startRefresh()
    func stopRefresh()
}

protocol QuotesViewPresenterProtocol {
    func onViewDidLoad()
    func refresh()
}
