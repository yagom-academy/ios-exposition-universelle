//
//  MainViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
// 

import UIKit

final class MainViewController: UIViewController {
    private enum Prefix {
        static let visitor = "방문객"
        static let location = "개최지"
        static let duration = "개최 기간"
        static let colon = " : "
    }
    
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
            let fileName = ExpoData.expoInformationFileName
            decodedData = try ExpoInformation.decode(from: fileName)
        } catch {}
        
        return decodedData
    }
    
    private func setUpView() {
        let decodedData = decodeJson()
        
        if let title = decodedData.title {
            self.expoTitleLabel.text = title.replacingOccurrences(of: "(", with: "\n(")
        }
        if let visitors = decodedData.visitors {
            let visitorsString = Prefix.colon + visitors.formatString()
            self.visitorsLabel.text = Prefix.visitor + visitorsString
            self.visitorsLabel.downSize(targetString: visitorsString)
        }
        if let location = decodedData.location {
            let locationValue = Prefix.colon + location
            self.locationLabel.text = Prefix.location + locationValue
            self.locationLabel.downSize(targetString: locationValue)
        }
        if let duration = decodedData.duration {
            let durationValue = Prefix.colon + duration
            self.durationLabel.text = Prefix.duration + durationValue
            self.durationLabel.downSize(targetString: durationValue)
        }
        self.descriptionLabel.text = decodedData.description
    }
}

