//  Expo1900 - ExpositionViewController.swift
//  Created by inho, LJ
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ExpositionViewController: UIViewController {
    @IBOutlet private weak var expositionTitleLabel: UILabel!
    @IBOutlet private weak var expositionImageView: UIImageView!
    @IBOutlet private weak var expositionVisitorsLabel: UILabel!
    @IBOutlet private weak var expositionLocationLabel: UILabel!
    @IBOutlet private weak var expositionDurationLabel: UILabel!
    @IBOutlet private weak var expositionDescriptionTextView: UITextView!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var showExhibitButton: UIButton!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
    private var expositionData: ExpositionData {
        didSet {
            configureView()
        }
    }
    
    required init?(coder: NSCoder) {
        guard let expositionInformation = JSONDecoder.parse(
            asset: ExpositionConstant.expositionAssetName,
            to: ExpositionData.self
        ) else {
            return nil
        }
        
        expositionData = expositionInformation
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private  func showExhibitButtonPressed(_ sender: UIButton) {
        guard let nextViewController: ExhibitViewController =
                self.storyboard?.instantiateViewController(
                    withIdentifier: ExpositionConstant.exhibitViewController)
                as? ExhibitViewController
        else {
            return
        }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func configureView() {
        expositionTitleLabel.text = expositionData.title
        expositionImageView.image = expositionData.expositionImage
        expositionVisitorsLabel.text = expositionData.visitorInformation
        expositionLocationLabel.text = expositionData.locationInformation
        expositionDurationLabel.text = expositionData.durationInformation
        expositionDescriptionTextView.text = expositionData.description
        leftFlagImageView.image = expositionData.flagImage
        showExhibitButton.setTitle(expositionData.exhibitButtonText, for: .normal)
        rightFlagImageView.image = expositionData.flagImage
    }
}
