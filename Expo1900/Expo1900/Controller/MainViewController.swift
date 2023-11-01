//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorNumberLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftFlagLabel: UIImageView!
    @IBOutlet weak var rightFlagLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingToUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func parsingToUI() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        guard let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: dataAsset.data) else { return }
        
        configureUI(expoInformation: expoInformation)
    }
    
    private func configureUI(expoInformation: ExpoInformation) {
        mainTitleLabel.text = expoInformation.formattedTitle
        mainImageView.image = UIImage(named: "poster")
        visitorNumberLabel.text = expoInformation.formattedVisitorsNumber
        locationLabel.text = expoInformation.location
        durationLabel.text = expoInformation.duration
        descriptionLabel.text = expoInformation.description
        leftFlagLabel.image = UIImage(named: "flag")
        rightFlagLabel.image = UIImage(named: "flag")
    }
    
    @IBAction func touchUpPushToExpoItemListViewButtonTapped(_ sender: UIButton) {
        guard let view = self.storyboard?.instantiateViewController(withIdentifier: "ExpoItemListViewController") as? ExpoItemListViewController else { return }

        self.navigationController?.pushViewController(view, animated: true)
    }
    
}

