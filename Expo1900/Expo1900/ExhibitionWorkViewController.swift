//
//  ExhibitionWorkViewController.swift
//  Expo1900
//
//  Created by iluxsm on 2020/12/23.
//

import UIKit

class ExhibitionWorkViewController: UIViewController {
    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workDescriptionTextView: UITextView!
    var workImage: UIImage?
    var workDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workImageView.image = workImage
        workDescriptionTextView.text = workDescription
    }
}

extension ExhibitionWorkViewController: SendInformationDelegate {
    func send(information: ExhibitionWork) {
        workImage = information.image
        workDescription = information.description
        navigationItem.title = information.name
    }
}
