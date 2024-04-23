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
    
//        navigationItem.title = "Menu"
//        navigationItem.hidesBackButton = true
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "bell"),
//            style: .plain,
//            target: nil,
//            action: #selector(bellTapped))
//        navigationItem.rightBarButtonItem?.tintColor = .label
//    }
    
    @objc
    private func bellTapped() {
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
    
    private func setupNavigationBar() {
//        guard let viewControllers = viewControllers as? [UINavigationController] else { return }
//        
//        for navigationController in viewControllers {
//            guard let rootViewController = navigationController.viewControllers.first else { continue }
//            
//            // Проверяем тип корневого контроллера и устанавливаем соответствующий заголовок
//            if rootViewController is MenuBarViewController {
//                rootViewController.navigationItem.title = "Home"
//            } else if rootViewController is BasketViewController {
//                rootViewController.navigationItem.title = "Basket"
//            } else if rootViewController is RegistrationViewController {
//                rootViewController.navigationItem.title = "Location"
//            } else if rootViewController is AuthorizationViewController {
//                rootViewController.navigationItem.title = "Profile"
//            }
//            
//            navigationController.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
//                image: UIImage(systemName: "bell"),
//                style: .plain,
//                target: self,
//                action: #selector(bellTapped)
//            )
//            navigationController.navigationBar.topItem?.rightBarButtonItem?.tintColor = .label
//        }
    }

}
