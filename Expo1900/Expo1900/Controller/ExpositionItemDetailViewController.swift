//
//  ExpositionItemDetailViewController.swift
//  Expo1900
//
//  Created by Max, Whales on 2023/06/29.
//

import UIKit

class ExpositionItemDetailViewController: UIViewController {
    private var expositionItemDetail: ExpositionItemEntity
    
    private let detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = SpacingNamespace.detailStackView
        
        return stackView
    }()
    
    private let itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        return imageView
    }()
    
    private let itemDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        
        return label
    }()
    
    init(expositionItemDetail: ExpositionItemEntity) {
        self.expositionItemDetail = expositionItemDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = expositionItemDetail.name
        
        configureView()
        addConstraints()
    }
    
    private func configureView() {
        view.addSubview(detailScrollView)
        detailScrollView.addSubview(detailStackView)
        
        itemImage.image = UIImage(named: expositionItemDetail.imageName)
        itemDescription.text = expositionItemDetail.description
        
        detailStackView.addArrangedSubview(itemImage)
        detailStackView.addArrangedSubview(itemDescription)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailScrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailScrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            detailStackView.topAnchor.constraint(
                equalTo: detailScrollView.topAnchor,
                constant: ConstraintsNamespace.stackViewFromScrollViewTop
            ),
            detailStackView.bottomAnchor.constraint(
                equalTo: detailScrollView.bottomAnchor,
                constant: ConstraintsNamespace.stackViewFromScrollViewBottom
            ),
            detailStackView.centerXAnchor.constraint(
                equalTo: detailScrollView.centerXAnchor
            ),
            detailStackView.widthAnchor.constraint(
                equalTo: detailScrollView.widthAnchor,
                constant: ConstraintsNamespace.stackViewFromScrollViewWidth
            ),
            
            itemImage.heightAnchor.constraint(lessThanOrEqualTo: itemImage.widthAnchor)
        ])
    }
}
