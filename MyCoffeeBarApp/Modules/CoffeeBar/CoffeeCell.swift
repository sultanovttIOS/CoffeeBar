//
//  CoffeeCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 3/4/24.
//

import UIKit

class CoffeeCell: UICollectionViewCell {

    static let reuseId = "coffee_cell"
    
    private lazy var cellImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16)
        view.textAlignment = .center
        view.textColor = .darkText
        return view
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textAlignment = .center
        view.textColor = .darkText
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textAlignment = .center
        view.textColor = .orange
        return view
    }()
    
    private lazy var stackLabel: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
            make.height.width.equalTo(89)
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        addSubview(stackLabel)
        stackLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(cellImage.snp.trailing).offset(16)
            make.bottom.equalToSuperview().offset(18)
        }
        stackLabel.addArrangedSubview(titleLabel)
        stackLabel.addArrangedSubview(subTitleLabel)
        stackLabel.addArrangedSubview(priceLabel)
    }
    
}
