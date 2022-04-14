//  Expo1900 - ViewController.swift
//  Created by Quokkaaa.
//  Copyright © yagom academy. All rights reserved.

import UIKit

fileprivate enum UITitle {
    static let visitorText = "방문객 :"
    static let locationText = "개최지 :"
    static let durationText = "개최 기간 :"
    static let goToKoreanItemsText = "한국의 출품작 보러가기"
    static let mainText = "메인"
}

fileprivate enum Unit {
    static let people = " 명"
}

fileprivate enum FileName {
    static let poster = "poster"
    static let flag = "flag"
    static let parisExpo = "exposition_universelle_1900"
}

final class ParisExpoVC: UIViewController {
    var parisExpoData: ParisExpo?
    
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
    
    @IBAction func touchUpKoreanItemsButton(_ sender: UIButton) {
        guard let koreanItemVC = storyboard?.instantiateViewController(withIdentifier: KoreanItemVC.identifier) else {
            return
        }
        navigationController?.pushViewController(koreanItemVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeParisExpoData()
        uploadImages()
        uploadLabels()
        navigationItem.title = UITitle.mainText
    }
    
    private func initializeParisExpoData() {
        guard let data = try? ParisExpo.decode(from: FileName.parisExpo) else {
            return
        }
        parisExpoData = data
    }
    
    private func uploadImages() {
        mainImageView.image = UIImage(named: FileName.poster)
        leftImageView.image = UIImage(named: FileName.flag)
        rightImageView.image = UIImage(named: FileName.flag)
    }
    
    private func uploadLabels() {
        configureTitleLabel()
        configureVisitorLabel()
        configureLocationLabel()
        configureDurationLabel()
        configureDesciptionLabel()
        ConfigureKoreanItemsButtonLabel()
    }
    
    private func configureTitleLabel() {
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.text = parisExpoData?.title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    private func configureVisitorLabel() {
        let numberFormatter: NumberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            return numberFormatter
        }()
        
        visitorsLabel.font = .systemFont(ofSize: CGFloat(20))
        visitorsLabel.text = UITitle.visitorText
        if let visitorsNumber = parisExpoData?.visitors as? NSNumber,
           let visitorsText = numberFormatter.string(from: visitorsNumber) {
            visitorsNumberLabel.text = visitorsText + Unit.people
        }
    }
    
    private func configureLocationLabel() {
        locationLabel.font = .systemFont(ofSize: CGFloat(20))
        locationLabel.text = UITitle.locationText
        locationDescriptionLabel.text = parisExpoData?.location
    }
    
    private func configureDurationLabel() {
        durationLabel.font = .systemFont(ofSize: CGFloat(20))
        durationLabel.text = UITitle.durationText
        durationDescriptionLabel.text = parisExpoData?.duration
    }
    
    private func configureDesciptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = parisExpoData?.description
    }
    
    private func ConfigureKoreanItemsButtonLabel() {
        koreanItemsButton.titleLabel?.text = UITitle.goToKoreanItemsText
    }
}
