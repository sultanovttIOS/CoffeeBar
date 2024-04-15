//
//  AuthorizationViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import FirebaseAuth

protocol AuthorizationViewControllerDelegate: AnyObject {
    func didLoginBtnTapped(with number: String)
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
    //MARK: Доработать
//    private func signIn() {
//        guard let text = authorizationView.phoneNumberTf.text else { return }
//        if text == "5555" {
//            AuthService.shared.signIn { result in
//                switch result {
//                case .success:
//                    self.showTabBar()
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//            //showTabBar()
//        }
//        //        authService.signIn(with: text) { result in
//        //            switch result {
//        //            case .success(let success):
//        //                print(success)
//        //            case .failure(let error):
//        //                print(error.localizedDescription)
//        //            }
//        //        }
//    }
    
    private func showTabBar() {
        let tabBarViewController = TabBarViewController()
        let navVc = UINavigationController(rootViewController: tabBarViewController)
        navVc.modalPresentationStyle = .fullScreen
        navigationController?.present(navVc, animated: false)
    }
    
    private func loginBtnTapped() {
        let vc = SMSViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AuthorizationViewController: AuthorizationViewControllerDelegate {
    func didLoginBtnTapped(with number: String) {
        AuthService.shared.sendSms(with: number) { result in
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
}
