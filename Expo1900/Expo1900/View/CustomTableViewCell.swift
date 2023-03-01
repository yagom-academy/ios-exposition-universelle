//
//  CustomTableViewCell.swift
//  Expo1900
//
//  Created by 혜모리, Andrew on 2023/02/23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "cell"
    
    private let entryImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let entryNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    private let entryShortDescriptionLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEntryList(image: String, name: String, shortDescription: String) {
        entryImageView.image = UIImage(named: image)
        entryNameLabel.text = name
        entryShortDescriptionLabel.text = shortDescription
    }
    
    private func configureLayout() {
        let itemStackView = createStackView()
        addSubview(itemStackView)
        
        NSLayoutConstraint.activate([
            entryImageView.widthAnchor.constraint(equalToConstant: 70),
            entryImageView.heightAnchor.constraint(equalToConstant: 60),
            
            itemStackView.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 10),
            itemStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor,
                                                constant: 20),
            itemStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor,
                                                 constant: -40),
            itemStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func createStackView() -> UIStackView {
        let subStackView = createSubStackView()
        let itemStackView = {
            let stackView = UIStackView(arrangedSubviews: [entryImageView, subStackView])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .center
            return stackView
        }()
        return itemStackView
    }
    
    private func createSubStackView() -> UIStackView {
        let subStackView = {
            let stackView = UIStackView(arrangedSubviews: [entryNameLabel, entryShortDescriptionLabel])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 4
            return stackView
        }()
        return subStackView
    }
}
