//
//  NetworkLayer.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 7/4/24.
//

import Foundation

class NetworkLayer {
    
    private let baseURL = URL(
        string: "https://www.themealdb.com/api/json/v1/1/")!
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    func fetchCategories(completion: @escaping (
        Result<[Category], Error>) -> Void
    ) {
        let url = baseURL.appendingPathComponent("categories.php")
        let components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true)
        guard let url = components?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                do {
                    let categories = try self.decoder.decode(
                        Categories.self,
                        from: data)
                    completion(.success(categories.categories))
                } catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
        func fetchProducts(
            by categoryName: String, completion: @escaping (
                Result<[Product], Error>) -> Void
        ) {
            let url = baseURL.appendingPathComponent("filter.php")
            var components = URLComponents(
                url: url,
                resolvingAgainstBaseURL: true)
            components?.queryItems = [.init(name: "c", value: categoryName)]
            guard let url = components?.url else { return }
            let request = URLRequest(url: url)
    
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    completion(.failure(error))
                }
                if let data {
                    do {
                        let model = try self.decoder.decode(Products.self, from: data)
                        sleep(2)
                        completion(.success(model.products))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    
    func fetchProductsPagination(
        with page: Int,
        limit: Int,
        completion: @escaping (
            Result<[ProductPagination], Error>) -> Void
    ) {
        let url = URL(string: "https://dummyjson.com/products")!
        var components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "limit", value: String(page * limit)),
            URLQueryItem(name: "skip", value: String(limit))
        ]
        guard let url = components?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                do {
                    let model = try self.decoder.decode(ProductResponse.self, from: data)
                    completion(.success(model.products))
                } catch {
                    completion(.failure(error))
                }
            }
            if let error {
                completion(.failure(error))
                return
            }
        }.resume()
    }

    func fetchIdMealDetails(
        by idMeal: String,
        completion: @escaping (
            Result<Meal, Error>) -> Void
    ) {
        let url = baseURL.appendingPathComponent("lookup.php")
        var components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true)
        components?.queryItems = [.init(name: "i", value: idMeal)]
        guard let url = components?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                do {
                    let model = try self.decoder.decode(Meals.self, from: data)
                    if let firstMeal = model.meals.first {
                        completion(.success(firstMeal))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
