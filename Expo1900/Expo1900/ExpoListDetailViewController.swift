//
//  ExpoListDetailViewController.swift
//  Expo1900
//
//  Created by TORI on 2021/04/14.
//

import UIKit

class ExpoListDetailViewController: UIViewController {
    
    var imageName: String?
    var descriptionText: String?
    
    let itemImage = UIImageView()
    let itemDescription = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
}
