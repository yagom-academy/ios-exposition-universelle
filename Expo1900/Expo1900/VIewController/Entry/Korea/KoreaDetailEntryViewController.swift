//
//  KoreaDetailEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaDetailEntryViewController: UIViewController {
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var descriptionLable: UILabel!
    
    private let modelManager = ModelManager.shared
    private let orientaionMask = OrientaionMake.shared
    
    override func viewDidLoad() {
        setDetailEntry()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if orientaionMask.isOrientaionMake() {
            orientaionMask.judgedOrientaionMake(true)
            descriptionLable.font = UIFont.preferredFont(forTextStyle: .footnote)
        } else {
            orientaionMask.judgedOrientaionMake(false)
            descriptionLable.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
    static func initDetailEntryData(_ data: StateEntry) -> KoreaDetailEntryViewController {
        let viewController = KoreaDetailEntryViewController(nibName: nil, bundle: nil)
        viewController.modelManager.detailEntry = data
        return viewController
    }

// MARK: - Init Setting

    private func setDetailEntry() {
        guard let value = modelManager.detailEntry else { return }
        detailImageView.image = UIImage(named: value.imageName)
        descriptionLable.text = value.description
        self.navigationItem.title = value.name
        
        descriptionLable.lineBreakStrategy = .hangulWordPriority
        descriptionLable.textAlignment = .justified
        descriptionLable.numberOfLines = 0
    }
}
