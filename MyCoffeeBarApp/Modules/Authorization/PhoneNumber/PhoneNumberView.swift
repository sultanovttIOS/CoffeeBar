//
//  PhoneNumberView.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 17/4/24.
//

import UIKit
import SnapKit

class PhoneNumberView: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "title_icon")
        return view
    }()
    
    private lazy var loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Authorization"
        view.font = .systemFont(ofSize: 34)
        view.textColor = .label
        view.textAlignment = .left
        return view
    }()
    
    private lazy var phoneNumberTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Phone number"
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
        image.image = UIImage(systemName: "phone.fill")
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
    
    private lazy var loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login", for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 25
        view.backgroundColor = .orange
        view.addTarget(
            self,
            action: #selector(loginBtnTapped),
            for: .touchUpInside)
        return view
    }()
    
    weak var delegate: PhoneNumberDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(imageView)
        addSubview(loginLabel)
        addSubview(phoneNumberTf)
        addSubview(loginButton)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.width.equalTo(170)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(60)
            make.width.equalTo(200)
            make.height.equalTo(34)
            make.left.equalToSuperview().offset(16)
        }
        phoneNumberTf.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(20)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTf.snp.bottom).offset(20)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func loginBtnTapped() {
        delegate?.didLoginBtn(
            with: phoneNumberTf.text ?? ""
        )
    }
}
