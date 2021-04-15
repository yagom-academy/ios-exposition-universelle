//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/04/11.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var detailTextLabel: UILabel!
    
    var item: ExhibitionWorks?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemInformation()
    }
    
    private func itemInformation() {
        guard let item = item else {
            return
        }
        self.navigationItem.title = ""
        itemImageView.image = UIImage(named: item.imageName)
        detailTextLabel.text = item.description
    }
}
