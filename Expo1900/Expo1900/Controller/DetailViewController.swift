//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import UIKit

class DetailViewController: UIViewController {
    var expoItemElement: ExpoItemElement?
    
    @IBOutlet weak var ExpoItemImageView: UIImageView!
    @IBOutlet weak var ExpoItemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        ExpoItemImageView.image = UIImage(named: expoItemElement?.imageName ?? "")
        ExpoItemDescriptionLabel.text = expoItemElement?.desc
    }
}
