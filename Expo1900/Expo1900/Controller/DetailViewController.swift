//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import UIKit

final class DetailViewController: UIViewController {
    var expoItemElement: ExpoItemElement?
    
    @IBOutlet weak var expoItemImageView: UIImageView!
    @IBOutlet weak var expoItemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        modifyNavigationTitle(to: expoItemElement?.name ?? "", in: self)
        modifyNavigationBackButtonTitle(to: "한국의 출품작", in: self)
    }
    
    private func updateUI() {
        expoItemImageView.image = UIImage(named: expoItemElement?.imageName ?? "")
        expoItemDescriptionLabel.text = expoItemElement?.desc
    }
}
