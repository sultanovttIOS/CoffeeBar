//
//  NetworkLayer.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 7/4/24.
//

import Foundation

struct NetworkLayer {
    private let baseURL = URL(string: "https://dummyjson.com/products")!
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    func fetchProducts(completion: @escaping (
        Result<[Product], Error>) -> Void
    ) {
        //MARK: создаем запрос на сервер но не отправляем его(собираем сумку)
        let request = URLRequest(url: baseURL)
        //MARK: сессия которая позволяет отправлять запрос "request" наружу
        URLSession.shared.dataTask(with: request) { data, response, error in
            // data --> успех, response --> по дефолту всегда приходит, error --> ошибка
            if let error {
                //MARK: проверяем ошибку на опциональность
                completion(.failure(error))
            }
            
            if let data {
                //MARK: проверяем данные на опциональность
                do {
                    //MARK: пытаемся распарсить данные
                    let model = try decoder.decode(Products.self, from: data)
                    //MARK: закидываем данные в замыкание
                    completion(.success(model.products))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume() // --> отправить
    }
}
