//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 기원우 on 2021/04/09.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescLabel: UILabel!
    private var itemData: KoreaItems = KoreaItems(name: "", imageName: "", shortDesc: "", description: "데이터 전달받지 못함")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDetailView(data: itemData)
    }
    
    func receiveItemData(data: KoreaItems) {
        self.itemData = data
    }
    
    private func configureDetailView(data: KoreaItems) {
        title = data.name
        itemImageView.image = UIImage(named: data.imageName)
        itemDescLabel.text = data.description
    }
    
}
