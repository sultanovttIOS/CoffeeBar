//
//  AuthService.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 12/4/24.
//

import Foundation
import FirebaseAuth

struct AuthService {
    func sendSms(with phoneNumber: String, completion: @escaping (Result<Void, Error>) -> Void) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let verificationID {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    completion(.success(()))
                }
            }
    }
    
    func signIn(with verificationCode: String,  completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            if let authResult {
                completion(.success(authResult))
            }
        }
    }
}
