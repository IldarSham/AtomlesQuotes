//
//  NetworkError.swift
//  AtomlesQuotes
//
//  Created by Ildar on 27.12.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingFailed
    case unknown
}
