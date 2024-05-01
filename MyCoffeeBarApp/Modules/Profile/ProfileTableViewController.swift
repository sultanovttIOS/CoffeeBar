//
//  ProfileViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 23/4/24.
//

import UIKit
import SnapKit

protocol ProfileDelegate: AnyObject {
    func didSwitchTheme(isOn: Bool)
}

class ProfileTableViewController: UITableViewController {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.style = .large
        return view
    }()
    
    private var sectionsHeader: [SectionData] = [
        SectionData(title: "LANGUAGE".localized()),
        SectionData(title: "ABOUT USER".localized()),
        SectionData(title: "THEME".localized()),
        SectionData(title: "ACCOUNT".localized())]
    
    private var sectionCell: [SectionItem] = [
        SectionItem(titles: ["Русский", "English"]),
        SectionItem(titles: ["Phone number".localized(),
                             "User".localized(),
                             "History".localized(),
                             "emdm".localized()]),
        SectionItem(titles: ["Light".localized()]),
        SectionItem(titles: ["Add account".localized(),
                             "Log out".localized()])]
    
    private let profileCellReuseIdentifier = String(describing: ProfileCell.self)
    private let profileHeaderReuseIdentifier = "profileHeader"
    private let languageManager = AppLanguageManager.shared
    
    private func update() {
        sectionsHeader = [
            SectionData(title: "LANGUAGE".localized()),
            SectionData(title: "ABOUT USER".localized()),
            SectionData(title: "THEME".localized()),
            SectionData(title: "ACCOUNT".localized())]
        sectionCell = [
            SectionItem(titles: ["Русский", "English"]),
            SectionItem(titles: ["Phone number".localized(),
                                 "User".localized(),
                                 "History".localized(),
                                 "emdm".localized()]),
            SectionItem(titles: ["Light".localized()]),
            SectionItem(titles: ["Add account".localized(),
                                 "Log out".localized()])]
        tableView.reloadData()
        setNavigationBar()
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: nil, queue: .main) { _ in
            self.setNavigationBar()
        }
        if UserDefaults.standard.bool(forKey: "theme") == true {
           // view.overrideUserInterfaceStyle = .dark
            navigationController?.navigationBar.tintColor = .white
           // navigationItem.titleView?.tintColor = .white
        } else {
         //   UserDefaults.standard.bool(forKey: "theme")
            //   view.overrideUserInterfaceStyle = .light
            navigationController?.navigationBar.tintColor = .black
        }

        //setNavigationBar()
    }
    
//    @objc 
//    private func userDefaultsDidChange() {
//        setNavigationBar()
//    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(
            ProfileCell.self,
            forCellReuseIdentifier: profileCellReuseIdentifier)
        tableView.register(
            HeaderTableViewCell.self,
            forHeaderFooterViewReuseIdentifier: profileHeaderReuseIdentifier)
        setNavigationBar()
        setConstraints()
    }
    
    private func setNavigationBar() {
//        let titleLabel = UILabel()
//        titleLabel.text = "Profile".localized()
//        titleLabel.textColor = UserDefaults.standard.bool(
//            forKey: "theme") ? .white : .black
//        navigationItem.titleView = titleLabel
        //navigationController?.navigationBar.tintColor = .label
            title = "Profile".localized()        
    }
    
    private func setConstraints() {
        view.addSubview(activityIndicator)
        view.bringSubviewToFront(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(40)
        }
    }
    
    override func numberOfSections(
        in tableView: UITableView) -> Int {
        return sectionsHeader.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return sectionCell[section].titles.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: profileCellReuseIdentifier,
            for: indexPath) as! ProfileCell
        cell.delegate = self
        cell.fillCell(with: sectionCell[indexPath.section], at: indexPath)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: profileHeaderReuseIdentifier) as! HeaderTableViewCell
        header.fillHeader(section: sectionsHeader[section])
        return header
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                isLoading = true
                
                languageManager.setAppLanguage(language: .ru)
                isLoading = false
            case 1:
                languageManager.setAppLanguage(language: .en)
            default:
                break
            }
        case 1:
            print("phone")
        default:
            break
        }
        update()
    }
}

extension ProfileTableViewController: ProfileDelegate {
    func didSwitchTheme(isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: "theme")
        view.overrideUserInterfaceStyle = isOn ? .dark : .light
        tableView.reloadData()
    }
}

