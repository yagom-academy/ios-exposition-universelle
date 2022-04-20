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
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        appDelegate?.shouldSupportAllOrientaion = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        appDelegate?.shouldSupportAllOrientaion = true
    }
    
    private func decodeJson() -> ExpoInformation {
        var decodedData = ExpoInformation(title: "",
                                          visitors: 0,
                                          location: "",
                                          duration: "",
                                          description: "")
        
        do {
            let fileName = "exposition_universelle_1900"
            decodedData = try ExpoInformation.decode(from: fileName)
        } catch {}
        
        return decodedData
    }
    
    private func setUpView() {
        let decodedData = decodeJson()
        let visitorsValue = ": \(decodedData.visitors?.formatString() ?? "")"
        let locationValue = ": \(decodedData.location ?? "")"
        let durationValue = ": \(decodedData.duration ?? "")"
        
        self.expoTitleLabel.text = decodedData.title?.replacingOccurrences(of: "(", with: "\n(")
        self.visitorsLabel.text = "방문객 " + visitorsValue
        self.locationLabel.text = "개최지 " + locationValue
        self.durationLabel.text = "개최 기간 " + durationValue
        self.descriptionLabel.text = decodedData.description
        
        self.visitorsLabel.downSize(targetString: visitorsValue)
        self.locationLabel.downSize(targetString: locationValue)
        self.durationLabel.downSize(targetString: durationValue)
    }
}

