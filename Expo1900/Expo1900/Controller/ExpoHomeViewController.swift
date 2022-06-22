//
//  ExpoHomeViewController.swift
//  Expo1900
//
//  Created by 재재, 보리사랑 on 2022/06/17.
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
        setupExpositionData()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.all)
    }

    private func setupExpositionData() {
        let exposition = loadJsonData(type: Exposition.self, "exposition", "json") 
        self.exposition = exposition
    }
    
    private func updateUI() {
        let visitorsNumber = modifyDecimalStyle(number: exposition?.visitors)
        titleLabel.text = exposition?.title.replacingOccurrences(of: "(", with: "\n(")
        mainImageView.image = UIImage(named: "poster")
        visitorsLabel.text = "방문객 : " + visitorsNumber
        locationLabel.text = "개최지 : " + (exposition?.location ?? "")
        durationLabel.text = "개최 기간 : " + (exposition?.duration ?? "")
        descriptionLabel.text = exposition?.expositionDescription
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
        navigationController?.navigationBar.isHidden = true
    }
    
    private func modifyDecimalStyle(number: Int?) -> String {
        guard let number = number else {
            return ""
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: number) ?? ""
    }
    
    @IBAction func pushToExpoMenuButtonDidTap(_ sender: UIButton) {
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "ExpoMenuViewController") as? ExpoMenuViewController else { return }
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
}
