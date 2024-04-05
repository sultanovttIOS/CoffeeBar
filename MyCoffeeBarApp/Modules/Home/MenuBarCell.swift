//
//  CoffeeBarCollectionViewCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

class MenuBarCell: UICollectionViewCell {

    static let reuseId = "coffeeBar_cell"
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.textAlignment = .center
        view.textColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        clipsToBounds = true
        backgroundColor = .purple
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func fill(with: CoffeeBar) {
        titleLabel.text = with.title
    }
}
