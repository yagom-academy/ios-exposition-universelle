//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var expositionUniverselle: ExpositionUniverselle?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = "메인"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpoInformation()
        setTextToDisplay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpoInformation() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionUniverselle = try jsonDecoder.decode(ExpositionUniverselle.self,
                                                                from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setTextToDisplay() {
        guard let expositionUniverselle = expositionUniverselle else {
            return
        }
        
        let fontSize = UIFont.systemFont(ofSize: 20)
        
        let vistors: String = "방문객 : \(expositionUniverselle.visitors) 명"
        let location: String = "개최지 : " + expositionUniverselle.location
        let duration: String = "개최 기간 : " + expositionUniverselle.duration
        
        let vistorsAttributed = NSMutableAttributedString(string: vistors)
        let locationAttributed = NSMutableAttributedString(string: location)
        let durationAttributed = NSMutableAttributedString(string: duration)
        
        let vistorsRange = (vistors as NSString).range(of: "방문객")
        let locationRange = (location as NSString).range(of: "개최지")
        let durationRange = (duration as NSString).range(of: "개최 기간")
        
        vistorsAttributed.addAttribute(.font, value: fontSize, range: vistorsRange)
        locationAttributed.addAttribute(.font, value: fontSize, range: locationRange)
        durationAttributed.addAttribute(.font, value: fontSize, range: durationRange)
        
        titleLabel.text = expositionUniverselle.title
        visitorsLabel.attributedText = vistorsAttributed
        locationLabel.attributedText = locationAttributed
        durationLabel.attributedText = durationAttributed
        descriptionTextView.text = expositionUniverselle.description
    }
}

