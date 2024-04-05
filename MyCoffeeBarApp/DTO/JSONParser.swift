//
//  JSONParser.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 5/4/24.
//

import UIKit

//struct JSONParser {
//    
//    let decoder = JSONDecoder() // -> JSON -> struct
//    
//    let encoder = JSONEncoder() // -> struct -> JSON
//    
////    func decode<T: Codable>(with data: Data, completion: (Result<T, Error>) -> Void) {
////        do {
////            let product = try decoder.decode(T.self, from: data)
////            completion(.success(product))
////        } catch let error {
////            completion(.failure(error))
////        }
////    }
//}
struct JSONParser{
    let decoder = JSONDecoder() // -> json -> struct
    let encoder = JSONEncoder() // -> struct -> json
    
    
    func decode<T: Codable>(with data: Data, completion: (Result<T,Error>) -> Void){
        do {
            let product = try decoder.decode(T.self, from: data)
            completion(.success(product))
        } catch let error{
            completion(.failure(error))
        }
    
    }
}
