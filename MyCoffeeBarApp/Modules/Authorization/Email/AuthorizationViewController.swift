//
//  AuthorizationViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

protocol AuthorizationViewControllerDelegate: AnyObject {
    func didLoginBtn(
        with email: String,
        password: String)
    func didPhoneNumberBtn()
}

class AuthorizationViewController: UIViewController {
        
    deinit {
        print("AuthorizationViewController deinited")
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
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        let leftBtn = UIButton(type: .system)
        leftBtn.tintColor = .label
        leftBtn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftBtn.addTarget(self, action: #selector(backButtonTapped),
                          for: .touchUpInside)
        let leftButton = UIBarButtonItem(customView: leftBtn)
        navigationItem.leftBarButtonItem = leftButton
    }
    
    private func setupConstraints() {
        view.addSubview(authorizationView)
        authorizationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func loginBtnTapped() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension AuthorizationViewController: AuthorizationViewControllerDelegate {
    func didPhoneNumberBtn() {
        let vc = PhoneNumberViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didLoginBtn(with email: String, password: String) {
        AuthService.shared.signIn(
            with: email,
            password: password
        ) {
            result in
            DispatchQueue.main.async {
                    switch result {
                    case .success(()):
                        self.loginBtnTapped()
                    case .failure(let error):
                        self.showAlert()
                        print(error.localizedDescription)
                }
            }
        }
    }
}
