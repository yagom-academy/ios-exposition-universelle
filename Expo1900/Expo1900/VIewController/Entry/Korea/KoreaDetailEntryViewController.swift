//
//  KoreaDetailEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaDetailEntryViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var descriptionLable: UILabel!
    
    var detailEntry: StateEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetailEntry()
    }
    
    private func setDetailEntry() {
        guard let detail = detailEntry else {
            return
        }
        detailImage.image = UIImage(named: detail.imageName)
        descriptionLable.text = detail.description
        self.navigationItem.title = detail.name
        
        descriptionLable.lineBreakMode = .byWordWrapping
        descriptionLable.numberOfLines = 0
        descriptionLable.textAlignment = .justified
        
    }

}
