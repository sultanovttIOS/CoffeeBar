//
//  AuthorizationView.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

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
        view.addTarget(
            self,
            action: #selector(loginBtnTapped),
            for: .touchUpInside)
        return view
    }()
    
    private lazy var phoneNumberTf: UITextField = {
        let view = UITextField()
        view.placeholder = "email"
        view.leftViewMode = .always
        let leftView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 56,
            height: 56))
        let image = UIImageView(frame: CGRect(
            x: 16,
            y: 16,
            width: 24,
            height: 24))
        image.image = UIImage(named: "phone_icon")
        image.tintColor = .lightGray
        leftView.addSubview(image)
        view.leftView = leftView
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 25
        view.addTarget(
            self,
            action: #selector(loginBtnTapped),
            for: .valueChanged)
        return view
    }()
    
    private lazy var passwordTf: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        view.leftViewMode = .always
        let leftView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 56,
            height: 56))
        let image = UIImageView(frame: CGRect(
            x: 16,
            y: 16,
            width: 24,
            height: 24))
        image.image = UIImage(named: "phone_icon")
        image.tintColor = .lightGray
        leftView.addSubview(image)
        view.leftView = leftView
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 25
        view.addTarget(
            self,
            action: #selector(loginBtnTapped),
            for: .valueChanged)
        return view
    }()
    
    weak var delegate: AuthorizationViewControllerDelegate?
    
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
        addSubview(phoneNumberTf)
        addSubview(passwordTf)
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
        phoneNumberTf.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(32)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
        passwordTf.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTf.snp.bottom).offset(32)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTf.snp.bottom).offset(20)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc 
    private func loginBtnTapped() {
        delegate?.didLoginBtnTapped(
            with: phoneNumberTf.text ?? "",
            password: passwordTf.text ?? "")
    }
}
