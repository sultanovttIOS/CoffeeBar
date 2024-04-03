//
//  CoffeeBarViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

class CoffeeBarViewController: UIViewController {

   private let data: [CoffeeBar] = [
    CoffeeBar(title: "Кофе"),
    CoffeeBar(title: "Выпечка"),
    CoffeeBar(title: "Десерты"),
    CoffeeBar(title: "Коктейли")]
    
    private lazy var coffeeBarCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(CoffeeBarCell.self,
                      forCellWithReuseIdentifier: CoffeeBarCell.reuseId)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var coffeeLabel: UILabel = {
        let view = UILabel()
        view.text = "Кофе"
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .left
        view.textColor = .label
        return view
    }()
    
    private lazy var coffeeCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 18
        //layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero, 
                                    collectionViewLayout: layout)
        //view.dataSource = self
        //view.delegate = self
        //view.register(CoffeeCell.self,
        //             forCellWithReuseIdentifier: CoffeeCell.reuseId)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(coffeeBarCV)
        coffeeBarCV.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(32)
            make.width.equalToSuperview()
        }
        view.addSubview(coffeeLabel)
        coffeeLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeBarCV.snp.bottom).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(60)
            make.left.equalToSuperview().offset(16)
        }
        view.addSubview(coffeeCV)
        coffeeCV.snp.makeConstraints { make in
            make.top.equalTo(coffeeLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}

extension CoffeeBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeBarCell.reuseId,
                                                      for: indexPath) as! CoffeeBarCell
        cell.fill(with: data[indexPath.row])
        return cell
    }
}

extension CoffeeBarViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch indexPath.row {
            case 0:
                return CGSize(width: 72, height: 32)
            case 1:
                return CGSize(width: 98, height: 32)
            case 2:
                return CGSize(width: 101, height: 32)
            case 3:
                return CGSize(width: 106, height: 32)
            default:
                return CGSize(width: view.frame.width, height: 32)
            }
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
       }
}
