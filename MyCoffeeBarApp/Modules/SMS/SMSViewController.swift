//
//  SendSmsViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 12/4/24.
//

import UIKit
import FirebaseAuth

protocol SMSDelegate: AnyObject {
    func didLoginBtnTapped()
}

class SMSViewController: UIViewController {

    private let smsCodeView = SMSCodeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        smsCodeView.delegate = self
    }
    
    private func setupUI() {
        view.addSubview(smsCodeView)
        smsCodeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SMSViewController: SMSDelegate {
    func didLoginBtnTapped() {
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
}
