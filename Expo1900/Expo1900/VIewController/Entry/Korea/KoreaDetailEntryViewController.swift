//
//  KoreaDetailEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaDetailEntryViewController: UIViewController {
    @IBOutlet private weak var detailImage: UIImageView!
    @IBOutlet private weak var descriptionLable: UILabel!
    
    private var detailEntry: StateEntry?
    private var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        setDetailEntry()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if appDelegate?.shouldSupportAllOrientation == false {
            appDelegate?.shouldSupportAllOrientation = true
            descriptionLable.font = UIFont.preferredFont(forTextStyle: .body)
        } else {
            appDelegate?.shouldSupportAllOrientation = false
            descriptionLable.font = UIFont.preferredFont(forTextStyle: .title2)
        }
    }
    
    static func initDetailEntryData(_ data: StateEntry) -> KoreaDetailEntryViewController {
        let viewController = KoreaDetailEntryViewController()
        viewController.detailEntry = data
        return viewController
    }
    
// MARK: - Init Setting

    private func setDetailEntry() {
        guard let value = detailEntry else { return }
        detailImage.image = UIImage(named: value.imageName)
        descriptionLable.text = value.description
        self.navigationItem.title = value.name
        
        descriptionLable.lineBreakStrategy = .hangulWordPriority
        descriptionLable.textAlignment = .justified
        descriptionLable.numberOfLines = 0
    }
}
