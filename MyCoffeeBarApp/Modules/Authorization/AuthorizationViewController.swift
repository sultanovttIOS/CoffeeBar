//
//  AuthorizationViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {

    private let authorizationView = AuthorizationView(frame: .zero)
    
    deinit {
        print("avc is deinited")
    }
    
    override func loadView() {
        super.loadView()
        view = authorizationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        authorizationView.didLoginBtnTapped = { [weak self] in
            guard let self else { return }
            let vc = CoffeeBarViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
