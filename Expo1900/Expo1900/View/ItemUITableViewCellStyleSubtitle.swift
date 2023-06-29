//
//  ItemUITableViewCellStyleSubtitle.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/29.
//

import UIKit

class ItemUITableViewCellStyleSubtitle: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
