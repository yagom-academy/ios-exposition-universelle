//  KoreanItemDetailVC.swift
//  Expo1900
//  Created by 김태현 on 2022/04/14

import UIKit

final class KoreanItemDetailViewController: UIViewController {
    var koreanItem: KoreanHistoricalItem?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
        configureLabel()
        navigationItem.title = koreanItem?.name
    }
    
    private func configureImage() {
        guard let imageName = koreanItem?.imageName else {
            return
        }
        mainImageView.image =  UIImage(named: imageName)
    }
    
    private func configureLabel() {
        descriptionLabel.text = koreanItem?.description
    }
}
