//
//  MainViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setUpData() {
        let fileName = "exposition_universelle_1900"
        let decodedData = try? ExpositionUniverselle.decode(from: fileName).get()
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        guard let numberOfVisitors = numberFormatter.string(for: decodedData?.visitors) else {
            return
        }
        
        titleLabel.text = decodedData?.title
        visitorsLabel.text = numberOfVisitors + " 명"
        locationLabel.text = decodedData?.location
        durationLabel.text = decodedData?.duration
        descriptionLabel.text = decodedData?.description
    }
}

