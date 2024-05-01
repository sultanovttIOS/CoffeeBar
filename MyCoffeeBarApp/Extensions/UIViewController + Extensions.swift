//
//  UIViewController + Extensions.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 1/5/24.
//

import UIKit

extension UIViewController {
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
