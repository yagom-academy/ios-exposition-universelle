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
    private var expositionData: ExpositionData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchExpositionData()
    }
    
    func fetchExpositionData() {
        do {
            expositionData = try JSONDecoder.parse(asset: ExpositionConstant.expositionAssetName,
                                                   to: ExpositionData.self)
            configureView()
        } catch ExpositionError.invalidAsset {
            showAlert(message: ExpositionError.invalidAsset.rawValue)
        } catch {
            showAlert(message: error.localizedDescription)
        }
    }
    
    func showAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title: ExpositionConstant.alertTitle,
                                                         message: message,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: ExpositionConstant.alertActionTitle, style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
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
