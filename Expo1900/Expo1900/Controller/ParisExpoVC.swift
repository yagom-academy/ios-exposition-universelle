//  Expo1900 - ViewController.swift
//  Created by Quokkaaa.
//  Copyright © yagom academy. All rights reserved.

import UIKit

fileprivate enum UITitle {
    static let visitorText = "방문객 :"
    static let locationText = "개최지 :"
    static let durationText = "개최 기간 :"
    static let goToKoreanItemsText = "한국의 출품작 보러가기"
}

fileprivate enum Unit {
    static let people = " 명"
}

final class ParisExpoVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var visitorsNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationDescriptionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var koreanItemsButton: UIButton!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var parisExpoData: ParisExpo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImages()
    }
    
    func uploadImages() {
        mainImageView.image = UIImage(named: "poster")
        leftImageView.image = UIImage(named: "flag")
        rightImageView.image = UIImage(named: "flag")
    }
    
    func initializeParisExpoData() {
        guard let data = try? parisExpoData?.decode(from: "exposition_universelle_1900") else {
            return
        }
        parisExpoData = data
    }
}

// MARK: method
extension ParisExpo {
    
}
