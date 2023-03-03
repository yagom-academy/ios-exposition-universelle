//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class DescriptionViewController: UIViewController {
    private var item: Item
    
    @IBOutlet private weak var DescriptionScrollView: UIScrollView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var itemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setImageView()
        setLabel()
        setAccessibilityProperties()
    }
    
    private func setNavigationBar() {
        self.navigationItem.title = item.name
    }
    
    private func setImageView() {
        guard let itemImage = UIImage(named: item.imageName) else { return }
        self.itemImageView.image = itemImage
    }
    
    private func setLabel() {
        self.descriptionLabel.text = item.description
    }
    
    init?(item: Item, coder: NSCoder) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionViewController {
    private func setAccessibilityProperties() {
        setLabelAccessibility()
        setImageViewAccessibility()
    }
    
    private func setLabelAccessibility() {
        self.descriptionLabel.accessibilityLabel = item.name + " 상세 설명"
        self.descriptionLabel.accessibilityValue = item.description
    }
    
    private func setImageViewAccessibility() {
        self.itemImageView.isAccessibilityElement = true
        self.itemImageView.accessibilityLabel = item.name
        self.itemImageView.accessibilityTraits = .image
    }
}
