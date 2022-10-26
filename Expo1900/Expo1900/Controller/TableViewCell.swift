//
//  TableViewCell.swift
//  Expo1900
//
//  Created by leewonseok on 2022/10/26.
//

import UIKit

class TableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        
        let marginguide = self.contentView.layoutMarginsGuide
        self.detailTextLabel?.numberOfLines = 0
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.topAnchor.constraint(equalTo: marginguide.topAnchor).isActive = true
        self.imageView?.leadingAnchor.constraint(equalTo: marginguide.leadingAnchor).isActive = true
        self.imageView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.imageView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.imageView?.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
