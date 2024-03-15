//
//  KoreanHeritageDetailViewController.swift
//  Expo1900
//
//  Created by Danny, Gray on 2024/03/15.
//

import UIKit

class KoreanHeritageDetailViewController: UIViewController {
    
    var itemImageName: String?
    var itemDescription: String?

    private let itemDetailScrollView: UIScrollView = {
        let itemDetailScrollView = UIScrollView()
        itemDetailScrollView.translatesAutoresizingMaskIntoConstraints = false
        itemDetailScrollView.showsHorizontalScrollIndicator = false
        return itemDetailScrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let itemDetailStackView: UIStackView = {
        let itemDetailStackView = UIStackView()
        itemDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        itemDetailStackView.axis = .vertical
        itemDetailStackView.alignment = .center
        itemDetailStackView.distribution = .fill
        itemDetailStackView.spacing = 48
        return itemDetailStackView
    }()
    
    private let itemDetailImageView: UIImageView = {
        let itemDetailImageView = UIImageView()
        itemDetailImageView.contentMode = .scaleAspectFit
        return itemDetailImageView
    }()
    
    private let itemDetailDescription: UILabel = {
        let itemDetailDescriptionLabel = UILabel()
        itemDetailDescriptionLabel.numberOfLines = 0
        return itemDetailDescriptionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        guard let unwrappedItemImageName = itemImageName else {
            return
        }
        
        itemDetailImageView.image = UIImage(named: unwrappedItemImageName)
        itemDetailDescription.text = itemDescription
        
        itemAddSubview()
    }
    
    func itemAddSubview() {
        view.addSubview(itemDetailScrollView)
        itemDetailScrollView.addSubview(contentView)
        contentView.addSubview(itemDetailStackView)
        itemDetailStackView.addArrangedSubview(itemDetailImageView)
        itemDetailStackView.addArrangedSubview(itemDetailDescription)
        
        setUpCellConstraints()
    }
    
    private func setUpCellConstraints() {
     
        NSLayoutConstraint.activate([
            
            itemDetailScrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemDetailScrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            itemDetailScrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemDetailScrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            itemDetailScrollView.contentLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemDetailScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemDetailScrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemDetailScrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemDetailScrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: itemDetailScrollView.frameLayoutGuide.widthAnchor),
            
            contentView.bottomAnchor.constraint(equalTo: itemDetailStackView.bottomAnchor),
            itemDetailStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemDetailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemDetailStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            itemDetailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6),
            itemDetailImageView.heightAnchor.constraint(equalTo: itemDetailImageView.widthAnchor)
        ])
    }
    
}
