//
//  CoffeeBarViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 2/4/24.
//

import UIKit
import SnapKit

class  MenuBarViewController: UIViewController {
    
    private lazy var menuBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(MenuBarCell.self,
                      forCellWithReuseIdentifier: MenuBarCell.reuseId)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Кофе"
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .left
        view.textColor = .label
        return view
    }()
    
    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero,
                                    collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(ProductsCell.self,
                      forCellWithReuseIdentifier: ProductsCell.reuseId)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let data: [CoffeeBar] = [
        CoffeeBar(title: "Кофе"),
        CoffeeBar(title: "Выпечка"),
        CoffeeBar(title: "Десерты"),
        CoffeeBar(title: "Коктейли")]
    
    private var counter = CounterModel(counter: 0)
    
    private var products: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
        setupNavigationItem()
        fetchProducts()
    }
    
    private func fetchProducts() {
        let parser = JSONParser()
        if let url = Bundle.main.url(forResource: "Products",
                                     withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            parser.decode(with: data){ [weak self] (result: Result<[ProductModel],
                                                    Error>) in
                guard let self else { return }
                switch result {
                case .success(let products):
                    self.products = products
                    self.productsCollectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
    }
    
    private func setupConstraints() {
        view.addSubview(menuBarCollectionView)
        menuBarCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(32)
            make.width.equalToSuperview()
        }
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(menuBarCollectionView.snp.bottom).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(60)
            make.left.equalToSuperview().offset(16)
        }
        view.addSubview(productsCollectionView)
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}

extension  MenuBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if collectionView == productsCollectionView {
            return products.count
        } else if collectionView == menuBarCollectionView {
            return data.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuBarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuBarCell.reuseId,
                                                          for: indexPath) as! MenuBarCell
            cell.fill(with: data[indexPath.row])
            return cell
            
        } else if collectionView == productsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.reuseId,
                                                          for: indexPath) as? ProductsCell
            let model = products[indexPath.row]
            cell?.delagate =  self
            cell?.fill(with: model)
            
            return cell ?? ProductsCell()
        } else {
            return UICollectionViewCell()
        }
    }
}

extension  MenuBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productsCollectionView {
            return CGSize(width: 343, height: 89)
        } else if collectionView == menuBarCollectionView {
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
        } else {
            return CGSize()
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
            if collectionView == productsCollectionView {
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            } else if collectionView == menuBarCollectionView {
                return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            } else {
                return UIEdgeInsets()
            }
        }
}

extension  MenuBarViewController: CoffeeCounterDelegate {
    func increase() {
        counter.counter -= 1
        if counter.counter < 0 {
            counter.counter = 0
        }
        productsCollectionView.reloadData()
    }
    
    func dicrease() {
        counter.counter += 1
        if counter.counter > 10 {
            counter.counter = 10
        }
        productsCollectionView.reloadData()
    }
}

extension MenuBarViewController: UICollectionViewDelegate {
    
    //MARK: didSelectItemAt
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuBarCollectionView {
            if let cell = menuBarCollectionView.cellForItem(at: indexPath) {
                cell.backgroundColor = .purple
            }
        }
    }
    
    //MARK: didDeselectItemAt
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = menuBarCollectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = .clear
        }
    }
}
