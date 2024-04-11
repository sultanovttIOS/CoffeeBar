//
//  ItemInfoViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 4/4/24.
//

import UIKit
import SnapKit

class ProductViewController: UIViewController {

    private lazy var productImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseId)
        return view
    }()
    
    private let descriptionView = DescriptionView()
    
    deinit {
        print("ProductsViewController deinited")
    }
    
    var data: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(productImageCollectionView)
        productImageCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(225)
        }
        view.addSubview(descriptionView)
        descriptionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(196)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
