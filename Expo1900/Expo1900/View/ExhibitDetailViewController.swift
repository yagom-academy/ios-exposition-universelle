//
//  ExhibitDetailViewController.swift
//  Expo1900
//
//  Created by sookim on 2021/04/12.
//

import UIKit

class ExhibitDetailViewController: UIViewController {
 
    var koreaItem: KoreaExhibitItem?
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var detailDescription: UILabel!
    
    override func viewDidLoad() {
        title = koreaItem?.name
        inputDetailData()

    }
    
    private func inputDetailData() {
        guard let selectImage = koreaItem?.image_name,
              let selectDescription = koreaItem?.desc  else {
            return
        }
        
        imageName.image = UIImage(named: selectImage)
        detailDescription.text = selectDescription
    }
}
