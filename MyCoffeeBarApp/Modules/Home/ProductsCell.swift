//
//  CoffeeCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 3/4/24.
//

import UIKit
import SnapKit

protocol ProductCellDelegate: AnyObject {
    func increase()
    func dicrease()
}

class ProductsCell: UICollectionViewCell {
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
        view.text = "111"
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 14)
        view.textAlignment = .left
        view.textColor = .orange
        view.text = "111"
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
        view.setImage(UIImage(named: "minus_icon"), for: .normal)
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
        view.setImage(UIImage(named: "plus_icon"), for: .normal)
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
    
    weak var delagate: ProductCellDelegate?
    
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
            make.leading.equalToSuperview()
        }
        addSubview(stackLabel)
        stackLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(cellImage.snp.trailing).offset(16)
            make.width.equalTo(144)
            make.bottom.equalToSuperview().offset(-18)
        }
        stackLabel.addArrangedSubview(titleLabel)
        stackLabel.addArrangedSubview(descriptionLabel)
        stackLabel.addArrangedSubview(priceLabel)
        
        addSubview(countStack)
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
    
    @objc
    private func plusBtnTapped() {
        delagate?.dicrease()
    }
    
    @objc
    private func minusBtnTapped() {
        delagate?.increase()
    }
    
    func fillCounter(with model: CounterModel) {
        countLabel.text = String(model.counter)
    }
    
    func fill(with model: Product) {
        titleLabel.text = model.strMeal
        priceLabel.text = String(model.idMeal)
        ImageDownloader.shared.loadImage(with: model.strMealThumb) { result in
            if case .success(let image) = result {
                DispatchQueue.main.async {
                    self.cellImage.image = UIImage(named: model.strMealThumb)
                }
            }
        }
    }
}
