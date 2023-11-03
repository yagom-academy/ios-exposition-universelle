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
    @IBOutlet weak var leftFlagLabel: UIImageView!
    @IBOutlet weak var rightFlagLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsingToUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func parsingToUI() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        guard let expoInformation = try? jsonDecoder.decode(ExpoInformation.self, from: dataAsset.data) else { return }
        
        configureUI(expoInformation: expoInformation)
    }
    
    private func configureUI(expoInformation: ExpoInformation) {
        expoTitleLabel.text = expoInformation.formattedTitle
        expoPosterImageView.image = UIImage(named: "poster")
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

