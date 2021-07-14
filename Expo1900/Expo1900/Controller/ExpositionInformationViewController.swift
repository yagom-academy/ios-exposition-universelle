//
//  ExpositionInformationViewController.swift
//  Expo1900
//
//  Created by KimJaeYoun on 2021/07/13.
//

import UIKit

class ExpositionInformationViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        guard let jsonData = NSDataAsset(name: String(describing: JsonFileName.exposition_universelle_1900))?.data else {
            return
        }
        guard let expositionInformation = try? JSONDecoder().decode(ExpositionInformation.self,
                                                                  from: jsonData) else { return }
        setUpLabels(to: expositionInformation)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpLabels(to item: ExpositionInformation) {
        titleLabel.text = item.formattedTitle
        visitorsLabel.text = item.formattedVisitors
        locationLabel.text = item.location
        durationLabel.text = item.duration
        descriptionLabel.text = item.description
    }
}
