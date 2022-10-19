//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Hamo, Mene on 2022/10/19.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var entryDetailTextView: UITextView!
    
    var entryImage: UIImage?
    var entryDescription: String?
    var entryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewToDisplay()
        self.navigationItem.title = entryName
    }
    
    private func setViewToDisplay() {
        entryImageView.image = entryImage
        entryDetailTextView.text = entryDescription
    }
}
