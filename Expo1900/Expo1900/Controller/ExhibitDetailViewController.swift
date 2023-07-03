//
//  ExhibitDetailViewController.swift
//  Expo1900
//
//  Created by karen on 2023/07/04.
//

import UIKit

final class ExhibitDetailViewController: UIViewController {
    private let exhibit: Items
    private let detailScrollView = UIScrollView()
    private let detailStackView = UIStackView()
    let itemImage = UIImageView()
    let itemDescription = UILabel()
    
    init(expositionItemDetail: Items) {
        self.exhibit = expositionItemDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = exhibit.name
        
        configureView()
    }
}

private extension ExhibitDetailViewController {
    func configureView() {
        view.addSubview(detailScrollView)
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        detailScrollView.addSubview(detailStackView)
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.axis = .vertical
        detailStackView.alignment = .center
        detailStackView.spacing = 10
        
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.image = UIImage(named: exhibit.imageName)
        
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        itemDescription.numberOfLines = 0
        itemDescription.text = exhibit.description
        
        detailStackView.addArrangedSubview(itemImage)
        detailStackView.addArrangedSubview(itemDescription)
    }
}
