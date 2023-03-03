//
//  ItemDescriptionViewController.swift
//  Expo1900
//
//  Created by kokkilE, rilla on 2023/02/23.
//

import UIKit

final class ItemDescriptionViewController: UIViewController {
    
    // MARK: - Property
    private let item: ExhibitItem?
    
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // MARK: - Init Method
    init(_ exhibitItem: ExhibitItem?) {
        item = exhibitItem
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View State Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialView()
    }
    
    // MARK: - Instance Method
    private func setInitialView() {
        view.backgroundColor = .white
        self.title = item?.name
        
        setScrollView()
        setStackView()
        setImageView()
        setDescriptionLabel()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.setAutoLayout(equalTo: view,
                                 isNeededWidthAnchor: false,
                                 leadingConstant: 12,
                                 trailingConstant: -12)
    }
    
    private func setStackView() {
        scrollView.addSubview(stackView)
        stackView.setAutoLayout(equalTo: scrollView, isNeededWidthAnchor: true)
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
    }
    
    private func setImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let imageName = item?.imageName,
              let image = UIImage(named: imageName) else { return }
        
        imageView.image = image
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant:200).isActive = true
        
        stackView.addArrangedSubview(imageView)
    }
    
    private func setDescriptionLabel() {
        let descriptionLabel = UILabel()
        
        descriptionLabel.text = item?.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        stackView.addArrangedSubview(descriptionLabel)
    }
}
