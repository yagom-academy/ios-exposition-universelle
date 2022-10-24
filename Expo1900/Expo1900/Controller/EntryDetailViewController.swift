//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by junho lee on 2022/10/20.
//

import UIKit

final class EntryDetailViewController: UIViewController {
    
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var expoEntry: ExpoEntry?
    
    init?(coder: NSCoder, entry: ExpoEntry) {
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
    
    private func configureEntryViews(expoEntry: ExpoEntry?) {
        guard let expoEntry = expoEntry else { return }
        navigationItem.title = expoEntry.name
        imageView.image = UIImage(named: expoEntry.imageName)
        descriptionTextView.text = expoEntry.description
    }
    
    func sendExpoEntry(_ data: ExpoEntry) {
        expoEntry = data
    }
}

