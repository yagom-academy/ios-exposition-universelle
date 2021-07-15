//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by JINHONG AN on 2021/07/12.
//

import UIKit

class EntryDetailViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak private var entryImageView: UIImageView!
    @IBOutlet weak private var entryDescriptionTextView: UITextView!
    
    //MARK: Properties
    private var entryItem: ExpoEntry?
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignContents()
    }
}

//MARK:- Set Data
extension EntryDetailViewController {
    func configure(with entryItem: ExpoEntry) {
        self.entryItem = entryItem
    }
}

//MARK:- Bind data with contents
extension EntryDetailViewController {
    private func assignContents() {
        guard let entryItem = entryItem else {
            return showAlert(error: DataTransferError.recievingError)
        }
        bind(with: entryItem)
    }
    
    private func bind(with detailContents: ExpoEntry) {
        entryImageView.image = UIImage(named: detailContents.imageName)
        entryDescriptionTextView.text = detailContents.description
    }
}
