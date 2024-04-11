//
//  Categories.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 8/4/24.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable, Equatable {
    let strCategory: String
    
//    enum CodingKeys: String, CodingKey {
//        case title = "strCategory"
//    }
//    
//    static func ==(lhs: Category, rhs: Category) -> Bool {
//        return lhs.title == rhs.title
//        
//    }
}
