//
//  ProductModel.swift
//  markety
//
//  Created by Alexandra Marum on 8/24/24.
//

import Foundation

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation, availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let thumbnail: String
    let images: [String]
    
    static let example = Product(id: 1, title: "Essence Mascara Lashes for Beauty", description: "Cleanses your face", category: "Beauty", price: 10.00, discountPercentage: 10.0, rating: 5.0, stock: 5, tags: ["Beauty"], brand: "CeraVe", sku: "No", weight: 10, warrantyInformation: "No Warranty", shippingInformation: "Delivery", availabilityStatus: "Available", reviews: [Review.example], returnPolicy: "No return", minimumOrderQuantity: 1, thumbnail: "...", images: ["..."])
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment, date, reviewerName, reviewerEmail: String
    
    static let example = Review(rating: 5, comment: "Good stuff", date: "Today", reviewerName: "Jane Doe", reviewerEmail: "Janedoe@gmail.com")
}
