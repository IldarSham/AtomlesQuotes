//
//  QuotesService.swift
//  AtomlesQuotes
//
//  Created by Ildar on 28.12.2021.
//

import Foundation

protocol QuotesService {
    func getQuotes(count: Int, completion: @escaping ([QuotesResponse]?, Error?) -> Void)
}

class QuotesSerivceImplementation: QuotesService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkServiceImplementation()) {
        self.networkService = networkService
    }
    
    func getQuotes(count: Int, completion: @escaping ([QuotesResponse]?, Error?) -> Void) {
        let request = QuotesRequest(count: count)
        
        networkService.performRequest(request) { result in
            switch result {
            case .success(let quotes):
                completion(quotes, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
