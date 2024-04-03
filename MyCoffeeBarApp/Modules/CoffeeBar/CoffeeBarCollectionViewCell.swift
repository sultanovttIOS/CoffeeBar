//
//  CoffeeBarCollectionViewCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

class CoffeeBarCollectionViewCell: UICollectionViewCell {
        
        private let titleLabel: UILabel = {
            let view = UILabel()
            //view.text = "Кофе"
            view.font = .systemFont(ofSize: 16)
            view.textAlignment = .center
            view.textColor = .label
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
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(32)
                make.width.equalTo(72)
            }
        }
}
