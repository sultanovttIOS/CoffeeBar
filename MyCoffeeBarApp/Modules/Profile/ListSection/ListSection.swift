//
//  ListSection.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 23/4/24.
//

import UIKit

enum ListSection {
    case sales([ListItem])
    case category([ListItem])
    case section([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .sales(let items):
            return items
        case .category(let items):
            return items
        case .section(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .sales(_):
            return "Sales"
        case .category(_):
            return "Category"
        case .section(_):
            return "Section"
        }
    }
}
