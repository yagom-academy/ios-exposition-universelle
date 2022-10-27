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
    private var expoEntryData: ExpoEntryData?
    
    init?(coder: NSCoder, expoEntryData: ExpoEntryData) {
        super.init(coder: coder)
        
        self.expoEntryData = expoEntryData
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEntryViews(expoEntryData: expoEntryData)
    }
    
    private func configureEntryViews(expoEntryData: ExpoEntryData?) {
        navigationItem.title = expoEntryData?.name
        imageView.image = expoEntryData?.image
        descriptionTextView.text = expoEntryData?.description
    }
}

