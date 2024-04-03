//
//  AuthorizationView.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

//protocol AuthorizationViewDelegate: AnyObject {
//
//}

class AuthorizationView: UIView {
    
    private lazy var titleImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "title_icon")
        return view
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Вход"
        view.font = .systemFont(ofSize: 34)
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти", for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 25
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var numberTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "555 555 555"
        view.leftViewMode = .always
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        let image = UIImageView(frame: CGRect(x: 16, y: 16, width: 24, height: 24))
        image.image = UIImage(named: "phone_icon")
        image.tintColor = .lightGray
        leftView.addSubview(image)
        view.leftView = leftView
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 25
        return view
    }()
    
    //weak var delegate: AuthorizationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(titleImage)
        addSubview(subTitleLabel)
        addSubview(loginButton)
        addSubview(numberTextField)
        
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.width.equalTo(170)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(60)
            make.width.equalTo(79)
            make.height.equalTo(34)
            make.left.equalToSuperview().offset(16)
        }
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(32)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
    }
}
