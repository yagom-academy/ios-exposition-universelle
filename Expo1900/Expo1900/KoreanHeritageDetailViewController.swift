//
//  KoreanHeritageDetailViewController.swift
//  Expo1900
//
//  Created by Gray, Danny on 2024/03/10.
//

import UIKit

class KoreanHeritageDetailViewController: UIViewController {
    
    @IBOutlet weak var itemDetailImageView : UIImageView!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    var itemImageName: String?
    var itemDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDetailContent()
    }
    
    private func setDetailContent() {
        itemDetailImageView.image = UIImage(named: itemImageName!)
        descriptionTextView.text = itemDescription
    }
}

