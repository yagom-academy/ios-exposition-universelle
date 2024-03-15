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
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var visitorsLabel: UILabel!
    @IBOutlet var visitorsNumberLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationStringLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var durationStringLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var leftFlagImageView: UIImageView!
    @IBOutlet var showKoreanEntryButton: UIButton!
    @IBOutlet var rightFlagImageView: UIImageView!
    
    weak var delegate: ExpositionViewDelegate?
    
    @IBAction func moveToKoreanEntryButtonTouchedUp(_ sender: UIButton) {
        delegate?.moveToKoreanEntry()
    }
    
    func updateComponents(with exposition: Exposition) {
        self.titleLabel.text = exposition.formattedTitle
        self.visitorsNumberLabel.text = NumberFormatter().string(with: exposition.visitors)
        self.locationStringLabel.text = exposition.location
        self.durationStringLabel.text = exposition.duration
        self.descriptionLabel.text = exposition.description
    }
}
