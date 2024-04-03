//
//  StartView.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//
import UIKit
import SnapKit

class StartView: UIView {
    
    private lazy var titleImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "title_icon")
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
            action: #selector(loginButtonTapped),
            for: .touchUpInside)
        return view
    }()
    
    private lazy var registrationButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Регистрация", for: .normal)
        view.tintColor = .black
        view.layer.cornerRadius = 25
        view.backgroundColor = .gray
        view.addTarget(
            self,
            action: #selector(registrationButtonTapped),
            for: .touchUpInside)
        return view
    }()
    
    var didLoginBtnTapped: (() -> Void)?
    
    var didRegistrationBtnTapped: (() -> Void)?
    
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
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(234)
            make.width.equalTo(170)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(98)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
        addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    func loginButtonTapped() {
        didLoginBtnTapped?()
    }
    
    @objc
    func registrationButtonTapped() {
        didRegistrationBtnTapped?()
    }
}
