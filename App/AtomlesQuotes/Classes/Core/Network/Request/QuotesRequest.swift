//
//  QuotesRequest.swift
//  AtomlesQuotes
//
//  Created by Ildar on 28.12.2021.
//

import Foundation

struct QuotesRequest: DataRequest {
    typealias Response = [QuotesResponse]
    
    let count: Int

    var url: String {
        return Constants.baseURL + "quotes/\(count)/"
    }
    
    var method: HTTPMethod {
        .get
    }
}
