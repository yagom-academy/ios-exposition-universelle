//
//  KoreaWorksDetailViewController.swift
//  Expo1900
//
//  Created by sole on 2020/12/23.
//

import UIKit

class KoreaWorksDetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var koreaWorksInfo: KoreaWorks?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = koreaWorksInfo?.name
        updateDetail()
    }
    
    func updateDetail() {
        if let koreaWorksInfo = self.koreaWorksInfo {
            imgView.image = koreaWorksInfo.image
            descriptionLabel.text = koreaWorksInfo.description
        }
    }
}
