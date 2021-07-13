//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © Hosinging, EHD. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    //MARK: - Label
    @IBOutlet weak var expositionTitleLabel: UILabel!
    @IBOutlet weak var expositionTitleLableInFrench: UILabel!
    @IBOutlet weak var expositionPoster: UIImageView!
    @IBOutlet weak var numberOfVisitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - NumberForamtter
    private var numberFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        try? obtainExpositionData()
    }
  
    //MARK: - Method
    private func obtainExpositionData() throws {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition") else { return }
        do {
            let expositionData = try FairJSONDecoder.shared.decoder.decode(Exposition.self, from: dataAsset.data)
            let titles = expositionData.title.components(separatedBy: "(")
            if let firstTitle = titles.first, let secondTitle = titles.last {
                expositionTitleLabel.text = firstTitle
                expositionTitleLableInFrench.text = "(\(secondTitle)"
            }
            expositionPoster.image = UIImage(named: "poster")
            guard let visitors = numberFormatter.string(for: expositionData.visitors) else { return }
            numberOfVisitorsLabel.text = "\(visitors) 명"
            locationLabel.text = expositionData.location
            periodLabel.text = expositionData.duration
            descriptionLabel.text = expositionData.description
        } catch {
            throw DecodingError.failedToDecode
        }
        
    }

}


