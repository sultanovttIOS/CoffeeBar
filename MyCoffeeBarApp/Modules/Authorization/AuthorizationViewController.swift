//
//  AuthorizationViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import FirebaseAuth

protocol AuthorizationViewControllerDelegate: AnyObject {
    func checkTF(with number: String)
}

class AuthorizationViewController: UIViewController {
    
    private let authorizationView = AuthorizationView(frame: .zero)
    
    deinit {
        print("AuthorizationViewController is deinited")
    }
    
    private let authService = AuthService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        sendSms()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
        loginBtnTapped()
    }
    
    private func loginBtnTapped() {
        authorizationView.didLoginBtnTapped = { [weak self] in
            guard let self else { return }
            signIn()
        }
    }
    private func setupConstraints() {
        view.addSubview(authorizationView)
        authorizationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    //MARK: Доработать
    private func sendSms() {
//        authService.sendSms(with: "+996990203074") { result in
//            if case.success = result {
//                print("success")
//            }
//        }
    }
    //MARK: Доработать
    private func signIn() {
        guard let text = authorizationView.phoneNumberTf.text else { return }
        //guard let text = authorizationView.didNumberTFCheck else { return }
        if text == "5555" {
            AuthService.shared.signIn { result in
                switch result {
                case .success:
                    self.showTabBar()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            //showTabBar()
        }
        //        authService.signIn(with: text) { result in
        //            switch result {
        //            case .success(let success):
        //                print(success)
        //            case .failure(let error):
        //                print(error.localizedDescription)
        //            }
        //        }
    }
    
    private func showTabBar() {
        let tabBarViewController = TapBarViewController()
        let navVc = UINavigationController(rootViewController: tabBarViewController)
        navVc.modalPresentationStyle = .fullScreen
        navigationController?.present(navVc, animated: false)
    }
}
//MARK: Доработать

extension AuthorizationViewController: AuthorizationViewControllerDelegate {
    func checkTF(with number: String) {
    
    }
}
