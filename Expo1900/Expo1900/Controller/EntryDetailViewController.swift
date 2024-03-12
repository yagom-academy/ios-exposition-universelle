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
    
    var entryDetailData: EntryDetail
    
    init?(coder: NSCoder, entryDetailData: EntryDetail) {
        self.entryDetailData = entryDetailData
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error occurs in required init")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = entryDetailData.name
        self.entryImageView.image = UIImage(named: entryDetailData.imageName)
        self.entryDescriptionLabel.text = entryDetailData.description
    }
}
