//
//  ProductCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 9/4/24.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    private lazy var productImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    static let reuseId = "product_cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func fillProductImage() {
        
    }
}
