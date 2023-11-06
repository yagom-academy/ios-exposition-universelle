//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by hyunMac on 11/3/23.
//

import UIKit

final class DescriptionDetailViewController: UIViewController {

    @IBOutlet private weak var DescriptionImageView: UIImageView!
    @IBOutlet private weak var DescriptionText: UITextView!

    private var titleName: String?
    private var descriptionText: String?
    private var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        self.navigationItem.title = titleName
        DescriptionText.text = descriptionText
        let errorAlert = ErrorAlert()
        
        guard let safeImageName = imageName else {
            return errorAlert.generateAlert(viewController: self, errorReason: ErrorReason.emptyImageData.rawValue)
        }
        
        DescriptionImageView.image = UIImage(named: safeImageName)
    }
}

extension DescriptionDetailViewController {
    func injectData(titleName: String, descriptionText: String, imageName: String) {
        self.titleName = titleName
        self.descriptionText = descriptionText
        self.imageName = imageName
    }
}
