//
//  ViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {

    private let startView = RegistrationView()
    
    deinit {
        print("StartViewController deinited")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
        setupLoginButton()
    }
    
    private func setupConstraints() {
        view.addSubview(startView)
        startView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(234)
            make.bottom.equalToSuperview().offset(272)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    private func setupLoginButton() {
        startView.didLoginBtnTapped = { [weak self] in
            guard let self else { return }
            let vc = AuthorizationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

