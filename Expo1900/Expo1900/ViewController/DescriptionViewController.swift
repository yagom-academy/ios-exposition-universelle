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
        setImageView()
        setLabel()
        setNavigationBar()
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
