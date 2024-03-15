//
//  EntryDetailView.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/15/24.
//

import UIKit

final class EntryDetailView: UIView {
    @IBOutlet private var entryImageView: UIImageView!
    @IBOutlet private var entryDescriptionLabel: UILabel!
    
    func updateComponents(with entryDetail: EntryDetail) {
        entryImageView.image = UIImage(named: entryDetail.imageName)
        entryDescriptionLabel.text = entryDetail.description
    }
}
