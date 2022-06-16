//
//  ExpoHomeViewController.swift
//  Expo1900
//
//  Created by 유한석 on 2022/06/17.
//

import UIKit

class ExpoHomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushToExpoMenuButtonDidTap(_ sender: UIButton) {
    }
}
