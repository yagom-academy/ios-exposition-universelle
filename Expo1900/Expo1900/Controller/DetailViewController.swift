//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
//

import UIKit

class DetailViewController: UIViewController {
    var expoItemElement: ExpoItemElement?
    
    @IBOutlet weak var ExpoItemImageView: UIImageView!
    @IBOutlet weak var ExpoItemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        modifyNavigationTitle(to: expoItemElement?.name ?? "", in: self)
        modifyNavigationBackButtonTitle(to: "한국의 출품작", in: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        modifyNavigationTitle(to: expoItemElement?.name ?? "", in: self)
        modifyNavigationBackButtonTitle(to: "한국의 출품작", in: self)
    }
    
    private func updateUI() {
        ExpoItemImageView.image = UIImage(named: expoItemElement?.imageName ?? "")
        ExpoItemDescriptionLabel.text = expoItemElement?.desc
    }
}
