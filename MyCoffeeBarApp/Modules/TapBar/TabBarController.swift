//
//  TapBarViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 4/4/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarColors()
        //navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupTabBar() {
        let menuViewController = createNavController(
            vc: MenuBarViewController(),
            itemName: "Menu".localized(),
            itemImage: "house")
        let basketViewController = createNavController(
            vc: BasketViewController(),
            itemName: "Basket".localized(),
            itemImage: "basket")
        let productViewController = createNavController(
            vc: CompasViewController(),
            itemName: "Compas".localized(),
            itemImage: "safari")
        let profileViewController = createNavController(
            vc: ProfileTableViewController(),
            itemName: "Profile".localized(),
            itemImage: "person")
        
        viewControllers = [
            menuViewController, basketViewController,
            productViewController, profileViewController]
    }
    
    private func setupTabBarColors() {
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .label
    }
    
    private func createNavController(
        vc: UIViewController,
        itemName: String,
        itemImage: String) -> UIViewController {
            let item = UITabBarItem(
                title: itemName,
                image: UIImage(
                    systemName: itemImage)?.withAlignmentRectInsets(
                        .init(top: 10, left: 0, bottom: 0, right: 0)),
                tag: 0)
            item.titlePositionAdjustment = .init(
                horizontal: 0, vertical: 5)
            let navController = UINavigationController(
                rootViewController: vc)
            navController.tabBarItem = item
            return navController
        }
}
