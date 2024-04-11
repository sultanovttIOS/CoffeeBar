//
//  DescriptionCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 9/4/24.
//

import UIKit
import SnapKit

class DescriptionCell: UICollectionViewCell {
    
    static let reuseId = "description_cell"
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.textColor = .label
        view.font = .systemFont(ofSize: 22)
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = .orange
        view.font = .systemFont(ofSize: 20)
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.textColor = .label
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    private lazy var countStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "minus_icon"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 14
        //view.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var countLabel: UILabel = {
        let view = UILabel()
        view.text = "0"
        view.font = .boldSystemFont(ofSize: 16)
        view.textAlignment = .center
        view.textColor = .black
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "plus_icon"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .orange
        view.layer.cornerRadius = 14
        //view.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(22)
            make.width.equalTo(78)
        }
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(48)
            make.trailing.equalToSuperview().offset(-16)
        }
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(16)
            //make.height.equalTo(34)
        }
        addSubview(countStack)
        countStack.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(36)
            make.width.equalTo(124)
        }
        countStack.addArrangedSubview(minusButton)
        countStack.addArrangedSubview(countLabel)
        countStack.addArrangedSubview(plusButton)
    }
}
