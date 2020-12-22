//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var parisExpositionInformation: ParisExpositionInformation?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    // label로 변경을 시도해보자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
          parisExpositionInformation = try decoder.decode(ParisExpositionInformation.self, from: dataAsset.data)
        } catch {
            print(error)
            return
        }
        
        setAllText()

    }
    
    @IBAction func touchUpMoveToNextButton(_ sender: UIButton) {
        let pushVC = self.storyboard?.instantiateViewController(identifier: "KoreanExpositionPage")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
    func setAllText() {
        titleLabel.text = parisExpositionInformation?.title
        visitorsLabel.text = String(parisExpositionInformation?.visitors ?? 0)
        locationLabel.text = parisExpositionInformation?.location
        durationLabel.text = parisExpositionInformation?.duration
        descriptionTextView.text = parisExpositionInformation?.description
    }
}
