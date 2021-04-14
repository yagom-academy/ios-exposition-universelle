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
    private var detailData: KoreaItems = KoreaItems(name: "", imageName: "", shortDesc: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDetailView(data: detailData)
    }
    
    func receiveDetailData(data: KoreaItems) {
        self.detailData = data
    }
    
    private func configureDetailView(data: KoreaItems) {
        title = data.name
        itemImageView.image = UIImage(named: data.imageName)
        itemDescLabel.text = data.description
    }
    
}
