//
//  PhoneNumberViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 17/4/24.
//

import UIKit

protocol PhoneNumberDelegate: AnyObject {
    func didLoginBtn(with number: String)
}

class PhoneNumberViewController: UIViewController {
    
    private let phonView = PhoneNumberView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupConstraints()
        phonView.delegate = self
    }
    
    private func setupConstraints() {
        view.addSubview(phonView)
        phonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func loginBtnTapped() {
        let vc = MenuBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PhoneNumberViewController: PhoneNumberDelegate {
    func didLoginBtn(with number: String) {
        AuthService.shared.sendSms(with: number) { result in
            DispatchQueue.main.async {
                switch result { //MARK: extension with phoneNumber
                case .success(()):
                    self.loginBtnTapped()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
