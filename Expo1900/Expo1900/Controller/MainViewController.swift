//
//  MainViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak private var expoTitleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
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
        var decodedData = ExpoInformation()
        
        do {
            decodedData = try ExpoInformation.decode(from: Constant.expoInformationFileName)
        } catch {}
        
        return decodedData
    }
    
    private func setUpView() {
        let decodedData = decodeJson()
        let visitorsValue = Constant.colon + (decodedData
                                                .visitors?
                                                .formatString() ?? "")
        let locationValue = Constant.colon + (decodedData.location ?? "")
        let durationValue = Constant.colon + (decodedData.duration ?? "")
        
        self.expoTitleLabel.text = decodedData.title?.replacingOccurrences(of: "(", with: "\n(")
        self.visitorsLabel.text = Constant.visitor + visitorsValue
        self.locationLabel.text = Constant.location + locationValue
        self.durationLabel.text = Constant.duration + durationValue
        self.descriptionLabel.text = decodedData.description
        
        self.visitorsLabel.downSize(targetString: visitorsValue)
        self.locationLabel.downSize(targetString: locationValue)
        self.durationLabel.downSize(targetString: durationValue)
    }
}

