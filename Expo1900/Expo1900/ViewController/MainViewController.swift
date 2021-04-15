//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoImageView: UIImageView!
    @IBOutlet weak var expoVisitorsLabel: UILabel!
    @IBOutlet weak var expoLocationLabel: UILabel!
    @IBOutlet weak var expoDurationLabel: UILabel!
    @IBOutlet weak var expoDescriptionLabel: UILabel!
    @IBOutlet weak var flagImageView1: UIImageView!
    @IBOutlet weak var flagImageView2: UIImageView!
    
    var parisianExpoData: Exposition?
    var koreanEntryData: [Exposition.Entry]?

    override func viewDidLoad() {
        super.viewDidLoad()
        parisianExpoData = try? JSONParser<Exposition>.parse("exposition_universelle_1900").get()
        koreanEntryData = try? JSONParser<[Exposition.Entry]>.parse("items").get()
        
        setMainViewData()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setMainViewData() {
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
