//
//  ItemInfoViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 4/4/24.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {
    
    private let productDetailsView = ProductView()
    var idMeal: String!
    private let networkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadMealDetails(idMeal: idMeal)
        setupUI()
    }
    
    private func setupUI() {
        setupConstraints()
        setupNavigationBar()
        makeToOrder()
    }
    
    private func setupConstraints() {
        view.addSubview(productDetailsView)
        productDetailsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func makeToOrder() {
//        productDetailsView.didOrderTapped = { [weak self] in
//           // guard let self else { return }
//            //MARK: доработать
//        }
    }
    
    private func setupNavigationBar() {
        let leftBtn = UIButton(type: .system)
        leftBtn.tintColor = .label
        leftBtn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        leftBtn.addTarget(
            self, action: #selector(backButtonTapped),
            for: .touchUpInside)
        let leftButton = UIBarButtonItem(customView: leftBtn)
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func loadMealDetails(idMeal: String) {
        networkLayer.fetchIdMealDetails(by: idMeal) { [weak self] result in
            guard let self else { return }
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
    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
