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
        
        guard let safeImageName = imageName else {
            return generateAlert(errorReason: "이미지가 안불러짐")
        }
        
        DescriptionImageView.image = UIImage(named: safeImageName)
    }
    
    func generateAlert(errorReason: String) {
        let alertController = UIAlertController(title: "경고", message: "\(errorReason) 에러가 발생했습니다.", preferredStyle: .alert)
        
        let confirmButton = UIAlertAction(title: "확인", style: .default)
        
        alertController.addAction(confirmButton)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension DescriptionDetailViewController {
    func injectData(titleName: String, descriptionText: String, imageName: String) {
        self.titleName = titleName
        self.descriptionText = descriptionText
//        self.imageName = imageName
    }
}
