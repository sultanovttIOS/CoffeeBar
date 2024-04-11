//
//  Products.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 7/4/24.
//

import Foundation

struct Products: Codable {
    let meals: [Product]

//    enum CodingKeys: String, CodingKey {
//        case product = "meals"
//    }
//    
//    static func ==(lhs: Products, rhs: Products) -> Bool {
//        return lhs.product == rhs.product
//    }
}

struct Product: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
//    enum CodingKeys: String, CodingKey {
//        case title = "strMeal"
//    }
//    
//    static func ==(lhs: Product, rhs: Product) -> Bool {
//        return lhs.title == rhs.title
//    }
}
