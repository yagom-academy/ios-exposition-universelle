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
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return imageView
    }()
    
    private let entryNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private let entryShortDescriptionLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEntryList(image: String, name: String, shortDescription: String) {
        self.entryImageView.image = UIImage(named: image)
        self.entryNameLabel.text = name
        self.entryShortDescriptionLabel.text = shortDescription
    }
    
    private func configureLayout() {
        let itemStackView = createStackView()
        addSubview(itemStackView)
        
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            itemStackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20),
            itemStackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -40),
            itemStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
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
