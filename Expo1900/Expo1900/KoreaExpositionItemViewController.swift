//
//  KoreaExpositionItemDetail.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/23.
//

import UIKit

class KoreaExpositionItemViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var navigationBarTitle: String?
    var itemImage: UIImage?
    var itemDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setAllDataInView()
    }
    
    private func setAllDataInView() {
        self.navigationItem.title = navigationBarTitle
        self.itemImageView.image = itemImage
        self.descriptionLabel.text = itemDescription
    }
}

extension KoreaExpositionItemViewController: DynamicTypeable {
    func setLabelFontStyle() {
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
