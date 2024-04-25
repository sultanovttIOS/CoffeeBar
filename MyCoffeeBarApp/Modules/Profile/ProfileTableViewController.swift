//
//  ProfileViewController.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 23/4/24.
//

import UIKit
import SnapKit

protocol ProfileDelegate: AnyObject {
    func didTheme(isOn: Bool)
}

class ProfileTableViewController: UITableViewController {
        
    private let sectionsHeader: [SectionData] = [
        SectionData(title:"LANGUAGE"),
        SectionData(title:"ABOUT USER"),
        SectionData(title: "THEME"),
        SectionData(title: "ACCOUNT")]
    
    private let sectionCell: [SectionItem] = [
        SectionItem(titles: ["Русский", "English"]),
        SectionItem(titles: ["Phone number", "User", "History", "emdm"]),
        SectionItem(titles: ["Light"]),
        SectionItem(titles: ["Add account", "Log out"])]
    
    private let profileCell = String(describing: ProfileTableViewController.self)
    private let profileHeader = "profileHeader"
    private let languageManager = AppLanguageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // MARK: update navigationItem tintColor
        NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: nil, queue: .main) { _ in
        }
        if UserDefaults.standard.bool(forKey: "theme") == true {
            view.overrideUserInterfaceStyle = .dark
           // navigationItem.titleView?.tintColor = .white
        } else {
            UserDefaults.standard.bool(forKey: "theme")
            view.overrideUserInterfaceStyle = .light
        }
    }
    
    private func setupUI() {
        title = "Profile"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileCell.self, forCellReuseIdentifier: profileCell)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: profileHeader)
    }
    
    override func numberOfSections(
        in tableView: UITableView) -> Int {
            sectionsHeader.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 2
        default:
            return 1
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: profileCell,
                for: indexPath) as! ProfileCell
            let model = sectionCell[indexPath.section]
            cell.fillCell(with: model, at: indexPath)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    override func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: profileHeader) as! HeaderTableViewCell
            header.fillHeader(section: sectionsHeader[section])
        return header
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ProfileCell
        switch indexPath {
        case [0,0]:
            languageManager.setAppLanguage(language: .ru)
            print("ru")
        case [0,1]:
            languageManager.setAppLanguage(language: .en)
            print("en")
        case [1,0]:
            print("phone")
        default:
            ()
        }
    }
}

extension ProfileTableViewController: ProfileDelegate {
    func didTheme(isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: "theme")
        if isOn {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
    
    
}
