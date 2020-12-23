//
//  ExpositionDescriptionViewController.swift
//  Expo1900
//
//  Created by zdo on 2020/12/22.
//

import UIKit

class ExpositionDescriptionViewController: UIViewController {
    var assetImageData: UIImage!
    var assetDescriptionData: String!
    @IBOutlet weak var assetImage: UIImageView!
    @IBOutlet weak var assetDescription: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDescriptionData()
    }
    
    private func setDescriptionData() {
        assetImage.image = assetImageData
        assetDescription.text = assetDescriptionData
        navigationItem.title = assetDescriptionData
    }
}
