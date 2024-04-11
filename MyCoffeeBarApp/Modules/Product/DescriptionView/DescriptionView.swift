//
//  ProductDescriptionView.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 9/4/24.
//

import UIKit
import SnapKit

class DescriptionView: UIView {
    
    private lazy var descriptionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(DescriptionCell.self, forCellWithReuseIdentifier: DescriptionCell.reuseId)
        return view
    }()
    
    private lazy var niceAdditionLabel: UILabel = {
        let view = UILabel()
        view.text = "Приятное дополнение"
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .left
        return view
    }()
    
    private lazy var someProductsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProductsCell.self, forCellWithReuseIdentifier: ProductsCell.reuseId)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(descriptionCollectionView)
        descriptionCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(120)
        }
        addSubview(niceAdditionLabel)
        niceAdditionLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionCollectionView.snp.bottom).offset(16)
            make.height.equalTo(24)
            make.width.equalTo(263)
            make.leading.equalToSuperview().offset(16)
        }
        addSubview(someProductsCollectionView)
        someProductsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(niceAdditionLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}
