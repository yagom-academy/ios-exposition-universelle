//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/20.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    typealias ExpoEntryData = (image: UIImage?, name: String, description: String)
    private var expoEntry: ExpoEntryData?
    
    init?(coder: NSCoder, entry: ExpoEntryData?) {
        super.init(coder: coder)
        self.expoEntry = entry
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEntryViews(expoEntry: expoEntry)
    }
    
    private func configureEntryViews(expoEntry: ExpoEntryData?) {
        guard let expoEntry = expoEntry else { return }
        navigationItem.title = expoEntry.name
        imageView.image = expoEntry.image
        descriptionTextView.text = expoEntry.description
    }
}

