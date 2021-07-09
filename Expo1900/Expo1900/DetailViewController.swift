//
//  DetailViewController.swift
//  Expo1900
//
//  Created by yun on 2021/07/08.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let validItem = item else {
            return
        }
        navigationItem.title = validItem.itemName

        navigationItem
        itemImage.image = UIImage(named: validItem.imageName)
        itemDescription.text = validItem.description
        
    }
    
    var item: KoreanItem?
    
    func getParsedData(with koreanItem: KoreanItem) {
        item = koreanItem
    }

    
}
