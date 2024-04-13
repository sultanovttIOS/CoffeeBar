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
            
        }
    
    private func loginBtnTapped() {
        authorizationView.didLoginBtnTapped = { [ weak self ] in
            guard let self else { return }
            //            let vc =  SendSmsViewController()
            //            navigationController?.pushViewController(vc, animated: true)
            signIn()
        }
    }
    private func setupConstraints() {
        view.addSubview(authorizationView)
        authorizationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-319)
        }
    }
    
    private func sendSms() {
        authService.sendSms(with: "+996990203074") { result in
            if case.success = result {
                print("success")
            }
        }
    }
    
    private func signIn() {
        guard let text = authorizationView.phoneNumberTf.text else { return }
        //guard let text = authorizationView.didNumberTFCheck else { return }
        authService.signIn(with: text) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension AuthorizationViewController: AuthorizationViewControllerDelegate {
    func checkTF(with number: String) {
    
    }
}
