//
//  DetailViewController.swift
//  Expo1900
//
//  Created by Hisop on 2023/11/02.
//

import UIKit

class DetailViewController: UIViewController {
    var name: String = ""
    var imageName: String = ""
    var detailDescription: String = ""
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var explanation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        navigationItem.title = name
        imageView.image = UIImage(named: imageName)
        
        explanation.text = detailDescription
    }
}


