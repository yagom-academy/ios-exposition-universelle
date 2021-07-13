//
//  ExpositionInformationViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

class ExpositionInformationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder = JSONDecoder()
        guard let data = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        guard let expositionInformation = try? jsonDecoder.decode(ExpositionInformation.self,
                                                                  from: data.data) else { return }
        titleLabel.text = expositionInformation.formattedTitle
        visitorsLabel.text = expositionInformation.formattedVisitors
        locationLabel.text = expositionInformation.location
        durationLabel.text = expositionInformation.duration
        descriptionLabel.text = expositionInformation.description
    }
    
}
