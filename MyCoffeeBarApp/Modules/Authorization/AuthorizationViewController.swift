//
//  AuthorizationViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {

    private let authorizationView = AuthorizationView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = authorizationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
