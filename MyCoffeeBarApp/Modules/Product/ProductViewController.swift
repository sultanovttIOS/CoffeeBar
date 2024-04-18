//
//  ItemInfoViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 4/4/24.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {
    private let productDetailsView = DescriptionView()
    var idMeal: String!
    private let networkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadMealDetails(idMeal: idMeal)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(productDetailsView)
        productDetailsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        productDetailsView.didOrderTapped = { [ weak self ] in
            guard let self else { return }
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func loadMealDetails(idMeal: String) {
        networkLayer.fetchIdMealDetails(by: idMeal) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let mealDetails):
                DispatchQueue.main.async {
                    self.productDetailsView.fill(with: mealDetails)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
