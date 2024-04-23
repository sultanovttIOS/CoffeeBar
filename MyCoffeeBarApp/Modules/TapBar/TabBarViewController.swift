//
//  TapBarViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 4/4/24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(customTabBar, forKey: "tabBar")
        setupTabItems()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        //navigationItem.title = "Menu"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: nil,
            action: #selector(bellTapped))
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    private func setupTabItems() {
        let homeVC =  MenuBarViewController()
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        let basketVC = BasketViewController()
        basketVC.tabBarItem.image = UIImage(systemName: "basket")
        
        let locationVC = RegistrationViewController()
        locationVC.tabBarItem.image = UIImage(systemName: "safari")
        
        let profileVC = AuthorizationViewController()
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers(
            [
                homeVC,
                basketVC,
                locationVC,
                profileVC
            ],
            animated: true
        )
    }
    
    @objc
    private func bellTapped() {
        
    }
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

