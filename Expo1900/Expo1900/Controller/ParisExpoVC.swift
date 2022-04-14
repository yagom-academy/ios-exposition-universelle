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
        initializeParisExpoData()
        uploadImages()
        uploadLabels()
    }
    
    func uploadImages() {
        mainImageView.image = UIImage(named: "poster")
        leftImageView.image = UIImage(named: "flag")
        rightImageView.image = UIImage(named: "flag")
    }
    
    func initializeParisExpoData() {
        guard let data = try? ParisExpo.decode(from: "exposition_universelle_1900") else {
            return
        }
        parisExpoData = data
    }
    
    func uploadLabels() {
        let numberFormatter: NumberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter
        }()
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.text = parisExpoData?.title.replacingOccurrences(of: "(", with: "\n(")
        
        visitorsLabel.font = .systemFont(ofSize: CGFloat(20))
        visitorsLabel.text = UITitle.visitorText
        if let visitorsNumber = parisExpoData?.visitors as? NSNumber,
           let visitorsText = numberFormatter.string(from: visitorsNumber) {
            visitorsNumberLabel.text = visitorsText + Unit.people
        }
        
        locationLabel.font = .systemFont(ofSize: CGFloat(20))
        locationLabel.text = UITitle.locationText
        locationDescriptionLabel.text = parisExpoData?.location
        
        durationLabel.font = .systemFont(ofSize: CGFloat(20))
        durationLabel.text = UITitle.durationText
        durationDescriptionLabel.text = parisExpoData?.duration
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = parisExpoData?.description
        
        koreanItemsButton.titleLabel?.text = UITitle.goToKoreanItemsText
    }
}

// MARK: method
extension ParisExpo {
    
}
