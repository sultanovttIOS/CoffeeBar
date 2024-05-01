//
//  SendSmsViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 12/4/24.
//

import UIKit
import SnapKit

class SMSViewController: UIViewController {
    
    private let smsView = SMSView()
    private let authService = AuthService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        smsView.delegate = self
    }
    
    private func setupUI() {
        view.addSubview(smsView)
        smsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SMSViewController: SMSDelegate {
    func verify() {
        let fieldsCode = smsView.getFieldCode()
        authService.signIn(with: fieldsCode
        ) {
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    let vc = TabBarController()
                    self.navigationController?.pushViewController(
                        vc,
                        animated: true
                    )
                case .failure(let error):
                    self.showAlert()
                    print(error.localizedDescription)
                }
            }
        }
    }
}
