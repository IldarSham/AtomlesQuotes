//
//  ImageLoaderCore.swift
//  AtomlesQuotes
//
//  Created by Ildar on 13.01.2022.
//

import Foundation

protocol ImageLoaderCore {
    func getImageData(from url: URL, completion: @escaping (_ data: Data?) -> Void)
}

class ImageLoaderCoreImplementation: ImageLoaderCore {
    func getImageData(from url: URL, completion: @escaping (_ data: Data?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
