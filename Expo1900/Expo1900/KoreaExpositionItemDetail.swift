//
//  KoreaExpositionItemDetail.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/23.
//

import UIKit

class KoreaExpositionItemDetail: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var navigationBarTitle: String?
    var itemImage: UIImage?
    var itemDescription: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar()
        self.itemImageView.image = itemImage
        self.descriptionLabel.text = itemDescription
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "한국의 출품작"
        self.navigationItem.title = navigationBarTitle
    }
}
