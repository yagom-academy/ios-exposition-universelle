//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoPosterImageView: UIImageView!
    @IBOutlet weak var visitorNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    private var expoInformationData = DataDecoder<ExpoInformation>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureUI(expoInformation: ExpoInformation) {
        expoTitleLabel.text = expoInformation.formattedTitle
        expoPosterImageView.image = UIImage(named: "poster")
        visitorNumberLabel.text = expoInformation.formattedVisitorsNumber
        locationLabel.text = expoInformation.location
        durationLabel.text = expoInformation.duration
        descriptionLabel.text = expoInformation.description
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
    
    func showAppTerminatingAlert() {
        let title = "시스템 오류가 발생했습니다."
        let message = "Data를 불러오는데 실패했습니다. 앱이 종료됩니다."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let terminateAction = UIAlertAction(title: "지금 종료", style: .destructive) { _ in
            exit(1)
        }
            
        alert.addAction(terminateAction)
        present(alert, animated: true)
    }
    
    private func parseData() {
        do {
            try configureUI(expoInformation: expoInformationData.parse(assetName: "exposition_universelle_1900"))
        } catch {
            showAppTerminatingAlert()
        }
    }
}

