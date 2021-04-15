//
//  Expo1900 - ExpositionController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoImageView: UIImageView!
    @IBOutlet weak var expoVisitorsLabel: UILabel!
    @IBOutlet weak var expoLocationLabel: UILabel!
    @IBOutlet weak var expoDurationLabel: UILabel!
    @IBOutlet weak var expoDescriptionLabel: UILabel!
    @IBOutlet weak var flagImageView1: UIImageView!
    @IBOutlet weak var flagImageView2: UIImageView!
    
    var parisianExpoData: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        parisianExpoData = try? JSONParser<Exposition>.parse("exposition_universelle_1900").get()
        
        setExpositionViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setExpositionViewData() {
        expoTitleLabel.text = parisianExpoData?.formattedTitle
        expoTitleLabel.numberOfLines = 0
        expoImageView.image = UIImage(named: "poster")
        expoVisitorsLabel.text = parisianExpoData?.formattedVisitors
        expoLocationLabel.text = parisianExpoData?.location
        expoDurationLabel.text = parisianExpoData?.duration
        expoDescriptionLabel.text = parisianExpoData?.description
        expoDescriptionLabel.numberOfLines = 0
        flagImageView1.image = UIImage(named: "flag")
        flagImageView2.image = UIImage(named: "flag")
    }
}
