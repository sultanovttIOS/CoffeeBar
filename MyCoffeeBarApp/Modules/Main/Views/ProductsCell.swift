//
//  CoffeeCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 3/4/24.
//

import UIKit
import SnapKit

class ProductsCell: UICollectionViewCell {
    static let reuseId = "coffee_cell"
    
    private lazy var cellImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16)
        view.textAlignment = .left
        view.textColor = .darkText
        view.text = "111"
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textAlignment = .left
        view.textColor = .darkText
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 14)
        view.textAlignment = .left
        view.textColor = .orange
        return view
    }()
    
    private lazy var stackLabel: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("-", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .black
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 14
        view.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
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
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 25)
        view.tintColor = .white
        view.backgroundColor = .orange
        view.layer.cornerRadius = 14
        view.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var countStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    var counter: Int = 0 {
        didSet {
            countLabel.text = "\(counter)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
            make.height.width.equalTo(89)
            make.leading.equalToSuperview()
        }
        contentView.addSubview(stackLabel)
        stackLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
            make.width.equalTo(144)
            make.bottom.equalToSuperview().offset(-18)
        }
        stackLabel.addArrangedSubview(titleLabel)
        stackLabel.addArrangedSubview(descriptionLabel)
        stackLabel.addArrangedSubview(priceLabel)
        
        contentView.addSubview(countStack)
        countStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(28)
            make.width.equalTo(94)
        }
        countStack.addArrangedSubview(minusButton)
        countStack.addArrangedSubview(countLabel)
        countStack.addArrangedSubview(plusButton)
    }
    
    func fill(with model: Product) {
        titleLabel.text = model.title
        priceLabel.text = String(model.id)
        
        DispatchQueue.main.async {
            ImageDownloader.shared.loadImage(with: model.description) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self.cellImage.image = image
                    case .failure(let error):
                        print("Failed to load image:", error.localizedDescription)
                    }
                }
            }
        }
    }

    func fill(with model: ProductPagination) {
        titleLabel.text = model.title
        descriptionLabel.text = model.brand
        priceLabel.text = String(model.price)
        DispatchQueue.main.async {
            ImageDownloader.shared.loadImage(with: model.thumbnail) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self.cellImage.image = image
                    case .failure(let error):
                        print("Failed to load image:", error.localizedDescription)
                    }
                }
            }
        }
    }
    
    @objc
    private func plusBtnTapped() {
        counter += 1
    }
    
    @objc
    private func minusBtnTapped() {
        counter = max(0, counter - 1)
    }
}
