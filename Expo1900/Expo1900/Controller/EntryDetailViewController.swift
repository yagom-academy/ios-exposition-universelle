//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Jaehun Lee on 3/8/24.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet var entryImageView: UIImageView!
    @IBOutlet var entryDescriptionLabel: UILabel!
    
    var entryDetail: EntryDetail
    
    init?(coder: NSCoder, entryDetail: EntryDetail) {
        self.entryDetail = entryDetail
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error occurs in required init")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = entryDetail.name
        self.entryImageView.image = UIImage(named: entryDetail.imageName)
        self.entryDescriptionLabel.text = entryDetail.description
    }
}
