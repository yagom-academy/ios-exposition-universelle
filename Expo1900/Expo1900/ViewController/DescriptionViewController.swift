//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class DescriptionViewController: UIViewController {
    var dataSource: ContentsDataSource?
    
    @IBOutlet private weak var DescriptionScrollView: UIScrollView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var itemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
        setLabel()
    }
    
    private func setImageView() {
        guard let item = dataSource?.selectedItem,
              let itemImage = UIImage(named: item.imageName) else { return }
        self.itemImage.image = itemImage
    }
    
    private func setLabel() {
        guard let item = dataSource?.selectedItem else { return }
        self.descriptionLabel.text = item.description
    }
}

protocol ContentsDataSource {
    var selectedItem: Item? { get set }
}
