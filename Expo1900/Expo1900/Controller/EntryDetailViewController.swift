//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by JINHONG AN on 2021/07/12.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    
    @IBOutlet weak var entryImageView: UIImageView!
    @IBOutlet weak var entryDescriptionTextView: UITextView!
    private var entryItem: ExpoEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponent()
    }
}

extension EntryDetailViewController {
    func configureEntryItem(from data: ExpoEntry) {
        entryItem = data
    }
}

extension EntryDetailViewController {
    func setComponent() {
        guard let entryItem = entryItem else {
            return showAlert(error: DataTransferError.recievingError)
        }
        entryImageView.image = UIImage(named: entryItem.imageName)
        entryDescriptionTextView.text = entryItem.description
    }
}
