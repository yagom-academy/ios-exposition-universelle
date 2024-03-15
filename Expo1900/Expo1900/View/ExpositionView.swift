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

final class ExpositionView: UIView {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var visitorsLabel: UILabel!
    @IBOutlet private var locationLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    weak var delegate: ExpositionViewDelegate?
    
    @IBAction private func moveToKoreanEntryButtonTouchedUp(_ sender: UIButton) {
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
