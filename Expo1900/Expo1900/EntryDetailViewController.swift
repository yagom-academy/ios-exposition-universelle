//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Hamo, Mene on 2022/10/19.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryImageView: UIImageView!
    @IBOutlet private weak var enteyDetailTextView: UITextView!
    
    var entryImage: UIImage?
    var entryDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
