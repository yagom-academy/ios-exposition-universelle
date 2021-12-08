//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by 권나영 on 2021/12/08.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryDescription: UILabel!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEntry()
    }
    
    func updateEntry() {
        guard let entry = entry else {
            return
        }

        entryImage.image = UIImage(named: entry.imageName)
        entryDescription.text = entry.description
    }
}
