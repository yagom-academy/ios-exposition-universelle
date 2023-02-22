//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class DescriptionViewController: UIViewController {
    private var item: Item?
    
    @IBOutlet weak var DescriptionScrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
    }
    
    func addItem(_ item: Item) {
        self.item = item
    }
    
    private func setImageView() {
        guard let item = self.item,
              let itemImage = UIImage(named: item.imageName) else { return }
        self.itemImage.image = itemImage
    }
    
}
