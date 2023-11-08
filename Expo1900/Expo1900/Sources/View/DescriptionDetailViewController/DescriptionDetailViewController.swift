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
        
        let newAlertConfiguration = AlertConfiguration(alertTitle: "메인에러타틀", alertMessaage: "에러가발생했습니다", alertActionTitle: "확인")
        
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
