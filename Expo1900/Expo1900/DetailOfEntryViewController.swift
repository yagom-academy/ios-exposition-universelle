//
//  DetailOfEntryViewController.swift
//  Expo1900
//
//  Created by 김태형 on 2020/12/26.
//

import UIKit

class DetailOfEntryViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var discriptionTextView: UITextView!
    
    var entry: EntryOfKorea?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let entry = entry else {
            return
        }
        self.navigationItem.title = entry.name
        discriptionTextView.text = entry.description
        detailImageView.image = UIImage(named: entry.imageName)
    }
    
}
