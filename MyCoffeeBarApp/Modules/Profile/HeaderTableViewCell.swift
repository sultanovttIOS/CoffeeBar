//
//  HeaderTableViewCell.swift
//  MyCoffeeBarApp
//
//  Created by Alisher Sultanov on 25/4/24.
//

import UIKit

class HeaderTableViewCell: UITableViewHeaderFooterView {
        
    private lazy var headerLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalToSuperview()
        }
    }
    
    func fillHeader(section: SectionData) {
        headerLabel.text = section.title
    }
}
