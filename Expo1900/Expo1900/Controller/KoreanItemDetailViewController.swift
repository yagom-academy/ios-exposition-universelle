//
//  KoreanItemDetailVC.swift
//  Expo1900
//
//  Created by 김태현 on 2022/04/14.
//

import UIKit

final class KoreanItemDetailViewController: UIViewController {
    var koreanItem: KoreanHistoricalItem?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImage()
        uploadLabel()
        navigationItem.title = koreanItem?.name
    }
    
    private func uploadImage() {
        guard let imageName = koreanItem?.imageName else {
            return
        }
        mainImageView.image =  UIImage(named: imageName)
    }
    
    private func uploadLabel() {
        descriptionLabel.text = koreanItem?.description
        descriptionLabel.numberOfLines = 0
    }
}
