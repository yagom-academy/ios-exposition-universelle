//
//  ExpositionItemTableViewCell.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemTableViewCell: UITableViewCell {
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let informationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    
    let shortDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        
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
        contentView.addSubview(informationStackView)
        informationStackView.addArrangedSubview(name)
        informationStackView.addArrangedSubview(shortDescription)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: MultiplierNamespace.itemCellImageWidthToCell
            ),
            image.heightAnchor.constraint(
                equalTo: contentView.heightAnchor
            ),
            informationStackView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 1 - MultiplierNamespace.itemCellImageWidthToCell
            ),
            informationStackView.leftAnchor.constraint(
                equalTo: image.rightAnchor
            )
        ])
    }
    
    func inputDataToCell(data: ExpositionItemEntity) {
        self.image.image = UIImage(named: data.imageName)
        self.name.text = data.name
        self.shortDescription.text = data.shortDescription
        self.accessoryType = .disclosureIndicator
    }
}
