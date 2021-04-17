//
//  Expo1900 - ExpositionController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet weak var expoTitleLabel: UILabel?
    @IBOutlet weak var expoImageView: UIImageView?
    @IBOutlet weak var expoVisitorsLabel: UILabel?
    @IBOutlet weak var expoLocationLabel: UILabel?
    @IBOutlet weak var expoDurationLabel: UILabel?
    @IBOutlet weak var expoDescriptionLabel: UILabel?
    @IBOutlet weak var flagImageView1: UIImageView?
    @IBOutlet weak var flagImageView2: UIImageView?
    
    var exposition: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        exposition = try? JSONParser<Exposition>.parse("exposition_universelle_1900").get()
        
        setExpositionViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setExpositionViewData() {
        expoTitleLabel?.text = exposition?.formattedTitle
        
        expoImageView?.image = UIImage(named: "poster")
        
        expoVisitorsLabel?.text = exposition?.formattedVisitors
        expoLocationLabel?.text = exposition?.location
        expoDurationLabel?.text = exposition?.duration
        
        expoDescriptionLabel?.text = exposition?.description
        
        flagImageView1?.image = UIImage(named: "flag")
        flagImageView2?.image = UIImage(named: "flag")
    }
}
