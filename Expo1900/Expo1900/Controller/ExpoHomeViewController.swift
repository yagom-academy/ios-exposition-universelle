//
//  ExpoHomeViewController.swift
//  Expo1900
//
//  Created by 유한석 on 2022/06/17.
//

import UIKit

class ExpoHomeViewController: UIViewController {
    private var exposition: Exposition?
    
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
        setExpositionData()
        updateUI()
    }
    
    private func updateUI() {
        let visitorsNumber = String(exposition?.visitors ?? 0)
        titleLabel.text = exposition?.title
        mainImageView.image = UIImage(named: "poster")
        visitorsLabel.text = visitorsNumber
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionLabel.text = exposition?.expositionDescription
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
    
    @IBAction func pushToExpoMenuButtonDidTap(_ sender: UIButton) {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "ExpoMenuViewController") as? ExpoMenuViewController else { return }
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    private func setExpositionData() {
        let exposition = loadJsonData(type: Exposition.self, "exposition", "json") 
        self.exposition = exposition
    }
}
