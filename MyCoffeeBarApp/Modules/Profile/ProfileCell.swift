//
//  ProfileCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 23/4/24.
//

import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
        
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    
    private lazy var switchTheme: UISwitch = {
        let view = UISwitch()
        view.isHidden = true
        view.addTarget(
            self, 
            action: #selector(switchTapped),
            for: .valueChanged)
        return view
    }()
        
    weak var delegate: ProfileDelegate?
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        self.selectionStyle = .none
            // self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(bgView.snp.leading).offset(15)
        }
        contentView.addSubview(switchTheme)
        switchTheme.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(bgView.snp.trailing).offset(-15)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.textColor = .label
        nameLabel.text = nil
        switchTheme.isHidden = true
    }
    
    func fillCell(
        with model: SectionItem,
        at indexPath: IndexPath
    ) {
        let title = model.titles[indexPath.row]
        nameLabel.text = title
        
        switch indexPath {
        case [2,0]:
            switchTheme.isHidden = false
            if UserDefaults.standard.bool(forKey: "theme") {
                nameLabel.text = "Dark".localized()
                switchTheme.isOn = true
            } else {
                nameLabel.text = "Light".localized()
                switchTheme.isOn = false
            }
        case [3,1]:
            nameLabel.textColor = .red
        default:
            ()
        }
    }
    
    @objc
    private func switchTapped(param: UISwitch) {
        delegate?.didSwitchTheme(isOn: param.isOn)
    }

}
