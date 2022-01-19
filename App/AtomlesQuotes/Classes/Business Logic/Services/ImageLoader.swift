//
//  ImageLoader.swift
//  AtomlesQuotes
//
//  Created by Ildar on 31.12.2021.
//

import UIKit

protocol ImageLoader {
    func loadImageFrom(urlString: String, completion: @escaping (UIImage?) -> Void)
}

class ImageLoaderImplementation: ImageLoader {
    
    let core: ImageLoaderCore
    
    init(core: ImageLoaderCore = ImageLoaderCoreImplementation()) {
        self.core = core
    }
    
    func loadImageFrom(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        core.getImageData(from: url) { (data) in
            if let data = data {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
    }
}
