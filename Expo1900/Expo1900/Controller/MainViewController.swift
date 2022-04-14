//
//  MainViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
// 

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setUpData() {
        let fileName = "exposition_universelle_1900"
        let decodedData = try? ExpositionUniverselle.decode(from: fileName).get()
    
        self.titleLabel.text = decodedData?.title
        self.visitorsLabel.text = decodedData?.visitors.formatString()
        self.locationLabel.text = decodedData?.location
        self.durationLabel.text = decodedData?.duration
        self.descriptionLabel.text = decodedData?.description
    }
}
