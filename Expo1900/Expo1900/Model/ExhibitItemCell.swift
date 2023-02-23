//
//  ExhibitItemCell.swift
//  Expo1900
//
//  Created by 김성준 on 2023/02/22.
//

import UIKit

class ExhibitItemCell: UITableViewCell {
    static let reuseIdentifier = "ExhibitItemCell"
    private let stackView = UIStackView()
    private let itemImageView = UIImageView()
    private let subStackView = UIStackView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        settingTest()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func settingTest() {
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.spacing = 10
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

        setStackView()
        
        itemImageView.center = self.center
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        subStackView.axis = .vertical
        subStackView.distribution = .fill
        subStackView.alignment = .leading
        
        titleLabel.font = .systemFont(ofSize: 18)
        subTitleLabel.font = .systemFont(ofSize: 13)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textAlignment = .left
        
        subStackView.addArrangedSubview(titleLabel)
        subStackView.addArrangedSubview(subTitleLabel)

        stackView.addArrangedSubview(itemImageView)
        stackView.addArrangedSubview(subStackView)
    }

    func setCellByIndexPath(_ indexPath: IndexPath) {
        guard let item = ExhibitItem.items?[indexPath.row] else { return }
        let image = UIImage(named: item.imageName)
        
        itemImageView.image = image
        titleLabel.text = item.name
        subTitleLabel.text = item.shortDescription
    }
    
    func setStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
    }
}
