//
//  File.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 11/4/24.
//

import Foundation
import UIKit

final class ImageDownloader {
    
    static let shared = ImageDownloader()
    
    func loadImage(with urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            completion(.success(image))
        }.resume()
    }
}
