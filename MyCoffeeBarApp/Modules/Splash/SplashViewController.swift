//
//  SplashViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 14/4/24.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let currentTime = Date()
        if let sessionDate = 
            UserDefaults.standard.object(
            forKey: "session"
            ) as? Date, 
            sessionDate >= currentTime {
            showTabBar()
        } else {
            showAuthViewController()
        }
    }
    
    private func showAuthViewController() {
        let startVc = RegistrationViewController()
        let navVc = UINavigationController(rootViewController: startVc)
        navVc.modalPresentationStyle = .fullScreen
        navigationController?.present(navVc, animated: false)
    }
    
    private func showTabBar() {
        let tabBarViewController = TabBarController()
        let navVc = UINavigationController(rootViewController: tabBarViewController)
        navVc.modalPresentationStyle = .fullScreen
        navigationController?.present(navVc, animated: false)
    }
}
