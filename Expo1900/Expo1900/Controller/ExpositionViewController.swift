//  Expo1900 - ExpositionViewController.swift
//  Created by inho, LJ
//  Copyright © yagom academy. All rights reserved.

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet weak var expositionTitleLabel: UILabel!
    @IBOutlet weak var expositionImageView: UIImageView!
    @IBOutlet weak var expositionVisitorsLabel: UILabel!
    @IBOutlet weak var expositionLocationLabel: UILabel!
    @IBOutlet weak var expositionDurationLabel: UILabel!
    @IBOutlet weak var expositionDescriptionTextView: UITextView!
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var showExhibitButton: UIButton!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    var expositionData: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expositionData = JSONDecoder.parse(assetName: "exposition_universelle_1900", to: Exposition.self)
        configureView()
    }
    
    @IBAction func showExhibitButtonPressed(_ sender: UIButton) {
        guard let nextViewController: ExhibitViewController = self.storyboard?.instantiateViewController(withIdentifier: "exhibitViewController") as? ExhibitViewController else {
            return
        }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func configureView() {
        guard let exposition = expositionData else {
            return
        }
        
        expositionTitleLabel.text = exposition.title
        expositionImageView.image = exposition.expositionImage
        expositionVisitorsLabel.text = exposition.visitorInformation
        expositionLocationLabel.text = exposition.locationInformation
        expositionDurationLabel.text = exposition.durationInformation
        expositionDescriptionTextView.text = exposition.description
        leftFlagImageView.image = exposition.flagImage
        showExhibitButton.setTitle(exposition.exhibitButtonText, for: .normal)
        rightFlagImageView.image = exposition.flagImage
    }
}

