//
//  SMSCodeView.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 13/4/24.
//

import UIKit
import SnapKit

protocol SMSDelegate: AnyObject {
    func verify()
}

class SMSView: UIView {
    
    private lazy var titleImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "title_icon")
        return view
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "SMS код"
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
    
    private lazy var fieldStack = UIStackView()
    private lazy var verifyFields = [VerifyTextField]()
    
    weak var delegate: SMSDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureVerifyTextField()
        setupConstraints()
        verifyFields[0].becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureVerifyTextField() {
        fieldStack.spacing = 5
        fieldStack.distribution = .fillEqually
        
        for number in 0...5 {
            let verifyTextField = VerifyTextField()
            verifyTextField.tag = number
            verifyTextField.fieldDelegate = self
            verifyFields.append(verifyTextField)
            fieldStack.addArrangedSubview(verifyTextField)
        }
        addSubview(fieldStack)
    }
    
    private func setupConstraints() {
        addSubview(titleImage)
        addSubview(subTitleLabel)
        addSubview(loginButton)
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.width.equalTo(170)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(60)
            make.width.equalTo(200)
            make.height.equalTo(34)
            make.left.equalToSuperview().offset(16)
        }
        fieldStack.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(32)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(fieldStack.snp.bottom).offset(20)
            make.width.equalTo(343)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
        }
    }
    
    func getFieldCode() -> String {
        var fieldsCode = ""
        verifyFields.forEach {
            fieldsCode.append($0.text ?? "")
        }
        return fieldsCode
    }
    
    @objc
    private func loginBtnTapped() {
        delegate?.verify()
    }
}

extension SMSView: FieldsDelagate {
    func activeNextField(tag: Int) {
        if tag != verifyFields.count - 1 {
            verifyFields[tag + 1].becomeFirstResponder()
        } else {
            delegate?.verify()
        }
    }
    
    func activePreviosField(tag: Int) {
        if tag != 0 {
            verifyFields[tag - 1].text = ""
            verifyFields[tag - 1].becomeFirstResponder()
        }
    }
}
