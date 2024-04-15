//
//  AuthService.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 12/4/24.
//

import Foundation
import FirebaseAuth

final class AuthService {
    static let shared = AuthService()
    
    private init() {}
    
    func signIn(
        with email: String = "asa04@gmail.com", 
        password: String = "123456",
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let authResult {
                strongSelf.saveSession()
                completion(.success(()))
            }
            if let error {
                completion(.failure(error))
            }
        }
        
    }
    func saveSession() {
        let date = Date()
        guard let oneMinLater = Calendar.current.date(
            byAdding: .second,
            value: 30,
            to: date
        ) else { return }
        UserDefaults.standard.set(oneMinLater, forKey: "session")
    }
    
    func sendSms(with phoneNumber: String, completion: @escaping (
        Result<Void, Error>) -> Void
    ) {
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
    
    func signIn(with verificationCode: String,  completion: @escaping (
        Result<AuthDataResult, Error>) -> Void
    ) {
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
