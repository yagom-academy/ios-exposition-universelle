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

    private var titleName: String
    private var descriptionText: String
    private var imageName: String
    
    init?(coder: NSCoder, titleName: String, descriptionText: String, imageName: String) {
        self.titleName = titleName
        self.descriptionText = descriptionText
        self.imageName = imageName
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        self.navigationItem.title = titleName
        DescriptionText.text = descriptionText
        
        let newAlertConfiguration = AlertConfiguration(title: AlertMessage.errorAlertTitle.description, messaage: AlertMessage.emptyImageData.description, actionTitle: AlertMessage.confirm.description)
        
        DescriptionImageView.image = UIImage(named: imageName)
    }
}
