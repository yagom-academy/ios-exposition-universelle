//
//  EntryDescriptionViewController.swift
//  Expo1900
//
//  Created by 고은 on 2021/12/14.
//

import UIKit

class EntryDescriptionViewController: UIViewController {
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    var entryData: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEntryDescription()
    }
    
    func loadEntryDescription() {
        if let entryImageLocation = entryData?.imageResourceLocator {
            descriptionImage.image = UIImage(named: entryImageLocation)
            descriptionText.text = entryData?.detailDescription
            navigationItem.title = entryData?.name
        }
    }
}
