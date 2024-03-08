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
    
    var entryDetailData: EntryDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let entryDetailData else { return }
        
        self.navigationItem.title = entryDetailData.name
        self.entryImageView.image = UIImage(named: entryDetailData.imageName)
        self.entryDescriptionLabel.text = entryDetailData.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}
