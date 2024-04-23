//
//  TrashViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 4/4/24.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController {
    
    private lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(
            ProductsCell.self,
            forCellWithReuseIdentifier: ProductsCell.reuseId)
        view.showsVerticalScrollIndicator = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.style = .large
        return view
    }()
    
    deinit {
        print("BasketViewController deinited")
    }
    
    private var products: [ProductPagination] = []
    private let networkLayer = NetworkLayer()
    private var isLoading = false {
        didSet {
            DispatchQueue.main.async {
                if self.isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    private var page = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupConstraints()
        fetchProducts()
    }
    
    private func setupConstraints() {
        view.addSubview(productCollectionView)
        productCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.horizontalEdges.equalToSuperview()//.inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        view.addSubview(activityIndicator)
        view.bringSubviewToFront(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }
    }
    
//    private func setupNavigationBar() {
//        self.navigationController?.navigationItem.title = "Basket"
//        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "bell"),
//            style: .plain,
//            target: nil,
//            action: #selector(bellTapped))
//        self.navigationController?.navigationItem.rightBarButtonItem?.tintColor = .label
//        
//        let leftBtn = UIButton(type: .system)
//        leftBtn.tintColor = .label
//        leftBtn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
//        leftBtn.addTarget(
//            self, action: #selector(backButtonTapped),
//            for: .touchUpInside)
//        let leftButton = UIBarButtonItem(customView: leftBtn)
//        self.navigationController?.navigationItem.leftBarButtonItem = leftButton
//    }
    
    private func fetchProducts() {
        isLoading = true
        networkLayer.fetchProductsPagination(with: page, limit: 10) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    sleep(2)
                    self.isLoading = false
                    self.products = products
                    self.productCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension BasketViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductsCell.reuseId,
            for: indexPath) as! ProductsCell
            
        let model = products[indexPath.row]
        cell.fill(with: model)
        return cell
    }
}

extension BasketViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == productCollectionView {
                return CGSize(width: 343, height: 89)
            }
            return CGSize(width: 343, height: 89)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
            if collectionView == productCollectionView {
                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            return UIEdgeInsets()
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        if indexPath.row == products.count - 1 {
            page += 1
            fetchProducts()
            print("To show end the last cell")
        }
        print("I'm here to show end of cell")
    }
}
