//
//  MainViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func decode() -> ExpoInformation? {
        let fileName = "exposition_universelle_1900"
        let decodedData = try? ExpoInformation.decode(from: fileName)
        
        return decodedData
    }
    
    private func setUpView() {
        guard let decodedData = decode() else {
            return
        }
        
        self.expoTitleLabel.text = decodedData.title
        self.visitorsLabel.text = try? decodedData.visitors.formatString()
        self.locationLabel.text = decodedData.location
        self.durationLabel.text = decodedData.duration
        self.descriptionLabel.text = decodedData.description
    }
}
