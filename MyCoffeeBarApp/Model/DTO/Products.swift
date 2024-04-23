//
//  Products.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 7/4/24.
//

import Foundation

//MARK: Доработать

struct ProductResponse: Codable {
    let products: [ProductPagination]
}

struct ProductPagination: Codable {
    let title: String
}

struct Products: Codable {
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = "meals"
    }
    
    static func ==(lhs: Products, rhs: Products) -> Bool {
        return lhs.products == rhs.products
    }
}

struct Product: Codable, Equatable {
    let title: String
    let description: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case title = "strMeal"
        case description = "strMealThumb"
        case id = "idMeal"
    }
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.id == rhs.id
    }
}

struct Meals: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
}
