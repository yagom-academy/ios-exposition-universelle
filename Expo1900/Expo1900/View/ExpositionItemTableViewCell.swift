//
//  ExpositionItemTableViewCell.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemTableViewCell: UITableViewCell {
    private let name = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let image = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let shortDescription = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(shortDescription)
    }
}
