//
//  NetworkManager.swift
//  ComposableNavigation
//
//  Created by Riccardo Cipolleschi on 16/11/21.
//

import Foundation

protocol NetworkManager {
    func get<T: Decodable>(key: String) -> T
}

class LiveNetworkManager: NetworkManager {
    func get<T: Decodable>(key: String) -> T {
        fatalError("")
    }
}
