//
//  MarketService.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import Foundation

class MarketService {
    private static let decoder = JSONDecoder()
    
    static func fetchProducts() async throws -> [Product] {
        let urlString = "https://dummyjson.com/products"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let productResponse = try decoder.decode(Welcome.self, from: data)
        
        return productResponse.products
    }
}

