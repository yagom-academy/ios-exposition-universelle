//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by kangkyungmin on 2023/07/02.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryDescription: UILabel!
    
    var entryImage: UIImage?
    var entryDetailDescription: String?
    var entryName: String?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = entryName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryImageView.image = entryImage
        entryDescription.text = entryDetailDescription
    }
}
