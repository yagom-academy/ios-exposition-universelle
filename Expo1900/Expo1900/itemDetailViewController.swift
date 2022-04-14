//
//  itemDetailViewController.swift
//  Expo1900
//
//  Created by 이시원 on 2022/04/15.
//

import UIKit

class itemDetailViewController: UIViewController {
    var item: Heritage?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var ItemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = item!.title
        itemImageView.image = UIImage(named: item!.imageName)
        ItemDescriptionLabel.text = item!.description
    }
    
  
}
