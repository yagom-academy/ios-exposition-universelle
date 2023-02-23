//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ItemDetailViewController: UIViewController {

    @IBOutlet weak var expoDescriptionLabel: UILabel!
    @IBOutlet weak var expoImageView: UIImageView!
    
    var expoItemName: String?
    var expoItemImage: String?
    var expoItemDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        self.title = expoItemName
        self.expoDescriptionLabel.text = expoItemDescription
        self.expoDescriptionLabel.numberOfLines = 0
        if let expoItemImage = expoItemImage {
            self.expoImageView.image = UIImage(named: expoItemImage)
        }
    }
}
