//
//  EntryDetailView.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/15/24.
//

import UIKit

class EntryDetailView: UIView {
    @IBOutlet var entryImageView: UIImageView!
    @IBOutlet var entryDescriptionLabel: UILabel!
    
    func updateComponents(with entryDetail: EntryDetail) {
        entryImageView.image = UIImage(named: entryDetail.imageName)
        entryDescriptionLabel.text = entryDetail.description
    }
}
