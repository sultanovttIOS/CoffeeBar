//
//  VerifyTextField.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 30/4/24.
//

import UIKit

protocol FieldsDelagate: AnyObject {
    func activeNextField(tag: Int)
    func activePreviosField(tag: Int)
}

class VerifyTextField: UITextField {
    
    weak var fieldDelegate: FieldsDelagate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        fieldDelegate?.activePreviosField(tag: tag)
    }
    
    private func configure() {
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 30)
        textColor = .purple
        tintColor = .clear
        backgroundColor = .systemGray6
        layer.cornerRadius = 14
        layer.borderColor = UIColor.purple.cgColor
    }
}

extension VerifyTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
            
            text = string
            
            if range.length == 0 {
                fieldDelegate?.activeNextField(tag: tag)
                resignFirstResponder()
            }
            return false
        }
}
