//
//  AuthorizationViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import FirebaseAuth

protocol AuthorizationViewControllerDelegate: AnyObject {
    func didLoginBtn(
        with email: String,
        password: String
    )
    func didPhoneBtn()
}

class AuthorizationViewController: UIViewController {
        
    deinit {
        print("AuthorizationViewController is deinited")
    }
        
    private let authorizationView = AuthorizationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        authorizationView.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubview(authorizationView)
        authorizationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func showTabBar() {
        let tabBarViewController = TabBarViewController()
        let navVc = UINavigationController(rootViewController: tabBarViewController)
        navVc.modalPresentationStyle = .fullScreen
        navigationController?.present(navVc, animated: false)
    }
    
    private func loginBtnTapped() {
        let vc = TabBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AuthorizationViewController: AuthorizationViewControllerDelegate {
    
    func didLoginBtn(with email: String, password: String) {
        AuthService.shared.signIn(with: email, password: password) { result in
            DispatchQueue.main.async {
                    switch result {
                    case .success(()):
                        self.loginBtnTapped()
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
    
    func didPhoneBtn() {
        let vc = PhoneNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
