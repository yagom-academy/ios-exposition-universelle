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
    
    private func decodeJson() -> ExpoInformation {
        do {
            let fileName = "exposition_universelle_1900"
            let decodedData = try ExpoInformation.decode(from: fileName)
            return decodedData
        } catch {
            return ExpoInformation(title: "",
                                   visitors: 0,
                                   location: "",
                                   duration: "",
                                   description: "")
        }
    }
    
    private func setUpView() {
        let decodedData = decodeJson()
        
        self.expoTitleLabel.text = decodedData.title
        self.locationLabel.text = decodedData.location
        self.durationLabel.text = decodedData.duration
        self.descriptionLabel.text = decodedData.description
        
        do {
            self.visitorsLabel.text = try decodedData.visitors.formatString()
        } catch {
            self.visitorsLabel.text = "\(error)"
        }
    }
}
