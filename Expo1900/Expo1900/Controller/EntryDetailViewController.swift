//
//  EntryDetailViewController.swift
//  Expo1900
//
//  Created by 유재호 on 2021/12/09.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet private weak var entryImage: UIImageView!
    @IBOutlet private weak var entryDescriptionLabel: UILabel!
    
    var entry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
        setEntryDescriptionLabel()
        setEntryImage()
        setImageAccessibilityHint()
    }
    
    private func setNavigationBarTitle() {
        navigationItem.title = entry?.name
    }
    
    private func setEntryDescriptionLabel() {
        entryDescriptionLabel.text = entry?.description
    }
    
    private func setEntryImage() {
        guard let imageName = entry?.imageName else {
            return
        }
        entryImage.image = UIImage(named: imageName)
    }
    
    private func setImageAccessibilityHint() {
        entryImage.accessibilityHint = Accessibility.entryImageHint[entry?.imageName ?? "이미지가 없어요."]
    }
}
