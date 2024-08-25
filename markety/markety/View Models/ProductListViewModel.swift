//
//  ProductListViewModel.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var favorites: [Product] = []
    @Published var cart: [Product] = []
    
    func fetchProducts() async throws {
        self.products = try await MarketService.fetchProducts()
    }
    
    func calcTotal() -> Double {
        var sum = 0.0
        for product in cart {
            sum += product.price
        }
        return sum
    }
    
}
