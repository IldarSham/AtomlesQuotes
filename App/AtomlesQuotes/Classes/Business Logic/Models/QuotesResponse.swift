//
//  QuotesResponse.swift
//  AtomlesQuotes
//
//  Created by Ildar on 28.12.2021.
//

import Foundation

struct QuotesResponse: Decodable {
    var characterImageUrl: String
    var quoteText: String
    var copyrightName: String
}
