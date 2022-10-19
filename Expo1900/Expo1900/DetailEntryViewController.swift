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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let jsonImageName = jsonImageName else { return }
        
        self.navigationItem.title = jsonName
        detailImageView.image = UIImage(named: jsonImageName)
        detailLabel.text = jsonDesc
        
    }
    
}
