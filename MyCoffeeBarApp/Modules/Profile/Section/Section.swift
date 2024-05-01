//
//  Section.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 29/4/24.
//

import Foundation

struct SectionData {
    var title: String
}

struct SectionItem {
    var titles: [String]
    
    init(titles: [String]) {
         self.titles = titles
     }
}
