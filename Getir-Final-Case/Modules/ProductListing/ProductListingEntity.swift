//
//  ProductListingEntity.swift
//  Getir-Final-Case
//
//  Created by Berke Parıldar on 9.04.2024.
//

import Foundation

struct ProductAPIResponse: Decodable {
    var id: String
    var name: String
    var productCount: Int
    var products: [Product]
}

struct Product: Decodable {
    var id: String
    var name: String
    var attribute: String?
    var thumbnailURL: URL
    var imageURL: URL
    var price: Double
    var priceText: String
}
