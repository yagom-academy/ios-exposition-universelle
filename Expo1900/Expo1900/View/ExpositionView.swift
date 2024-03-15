//
//  ExpositionView.swift
//  Expo1900
//
//  Created by Jaehun Lee on 3/15/24.
//

import UIKit

protocol ExpositionViewDelegate: AnyObject {
    func moveToKoreanEntry()
}

class ExpositionView: UIView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var visitorsLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    weak var delegate: ExpositionViewDelegate?
    
    @IBAction func moveToKoreanEntryButtonTouchedUp(_ sender: UIButton) {
        delegate?.moveToKoreanEntry()
    }
    
    func updateComponents(with exposition: Exposition) {
        self.titleLabel.text = exposition.formattedTitle
        self.visitorsLabel.text = NumberFormatter().string(with: exposition.visitors)
        self.locationLabel.text = exposition.location
        self.durationLabel.text = exposition.duration
        self.descriptionLabel.text = exposition.description
    }
}
