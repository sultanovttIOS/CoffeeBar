//
//  Products.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 7/4/24.
//

import Foundation

struct Products: Codable {
    let products: [Product]
}

struct Product: Codable {
    let title: String
    let description: String
    let price: Int
    let thumbnail: String
}
