//
//  Coordinator.swift
//  AtomlesQuotes
//
//  Created by Ildar on 20.12.2021.
//

import Foundation

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
