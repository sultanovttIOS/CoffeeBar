//
//  CompasViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 30/4/24.
//

import UIKit
import SnapKit

class CompasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Compas"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(bellBtnTapped))
        navigationController?.navigationBar.tintColor = .label
    }
    
    @objc
    private func bellBtnTapped() {
        print("bell Compass")
    }
}
