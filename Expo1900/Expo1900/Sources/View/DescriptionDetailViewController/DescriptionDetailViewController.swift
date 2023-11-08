//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by hyunMac on 11/3/23.
//

import UIKit

final class DescriptionDetailViewController: UIViewController, Identifying {

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
        
        let newAlertConfiguration = AlertConfiguration(title: AlertMessage.ErrorAlertTitle.description, messaage: AlertMessage.emptyImageData.description, actionTitle: AlertMessage.Confirm.description)
        
        guard let safeImageName = imageName else {
            return ShowAlert.presentAlert(viewController: self, configuration: newAlertConfiguration)
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
