//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expositionUniverselle: ExpositionUniverselle? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navigationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExpoInformation()
//        navigationButton.setTitle("한국의 출품작 보러가기", for: .normal)
    }
    
    private func setupExpoInformation() {
        parseExpositionUniverselleData()
        updatePosterDescription()
    }
    
    private func parseExpositionUniverselleData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionUniverselle = try jsonDecoder.decode(ExpositionUniverselle.self, from: dataAsset.data)
        } catch {
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error) {
        switch error {
        case ExpoError.decoding:
            print(ExpoError.decoding.localizedDescription)
        default:
            print("unknown error!!")
        }
    }
    
    private func updatePosterDescription() {
        updateTitleLabel()
        updateVisitorsLabel()
        updateLocationLabel()
        updateDurationLabel()
        updateDescriptionLabel()
    }
    
    private func updateTitleLabel() {
        let title = expositionUniverselle?.title
        let changeTitle = title?.replacingOccurrences(of: "(", with: "\n(")
        
        titleLabel.text = changeTitle
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    }
    
    private func updateVisitorsLabel() {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        
        guard let visitors = numberformatter.string(for: expositionUniverselle?.visitors) else {
            return
        }
        
        visitorsLabel.text = "방문객 : \(visitors) 명"
    }
    
    private func updateLocationLabel() {
        guard let location = expositionUniverselle?.location else {
            return
        }
        
        locationLabel.text = "개최지 : \(location)"
    }
    
    private func updateDurationLabel() {
        guard let duration = expositionUniverselle?.duration else {
            return
        }
        
        durationLabel.text = "개최기간 : \(duration)"
    }
    
    private func updateDescriptionLabel() {
        descriptionLabel.text = expositionUniverselle?.description
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
    }
    
    @IBAction func navigationButtonDidTap(_ sender: UIButton) {
        goToKoreaEntryView()
    }
    
    func goToKoreaEntryView() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "KoreaEntryViewController") as? KoreaEntryViewController else {
            return
        }

        self.navigationController?.pushViewController(controller, animated: true)
    }
}

