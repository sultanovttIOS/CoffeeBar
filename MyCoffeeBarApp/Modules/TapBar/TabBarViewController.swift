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
    }
    
    private func setupTabItems() {
        let homeVC =  MenuBarViewController()
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        let basketVC = ProductViewController()
        basketVC.tabBarItem.image = UIImage(systemName: "basket")
        
        let locationVC = StartViewController()
        locationVC.tabBarItem.image = UIImage(systemName: "safari")
        
        let profileVC = AuthorizationViewController()
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([homeVC, basketVC, locationVC, profileVC], animated: true)
    }
}
