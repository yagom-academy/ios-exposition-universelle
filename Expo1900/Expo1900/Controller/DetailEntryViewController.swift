//
//  DetailEntryViewController.swift
//  Expo1900
//
//  Created by baem,woong on 2022/10/19.
//

import UIKit

class DetailEntryViewController: UIViewController {
    var jsonName: String?
    var jsonDesc: String?
    var jsonImageName: String?
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewFromReceivedData()
    }
    
    func configureViewFromReceivedData() {
        if let jsonImageName = jsonImageName {
            self.navigationItem.title = jsonName
            detailImageView.image = UIImage(named: jsonImageName)
            detailLabel.text = jsonDesc
        }
    }
}
