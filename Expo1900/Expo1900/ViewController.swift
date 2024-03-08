//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    
    var expositionIntroduction: ExpositionIntroduction!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionIntroduction = try jsonDecoder.decode(ExpositionIntroduction.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        titleLabel.text = expositionIntroduction.title
        posterImageView.image = UIImage(named: "poster.png")
        
        let visitorsString = String(expositionIntroduction.visitors)
        
        let rangeStartIndex = visitorsString.index(visitorsString.startIndex, offsetBy: 2)
        let rangeEndIndex = visitorsString.index(visitorsString.endIndex, offsetBy: -3)
        
        let visitorsFristNumber = visitorsString.prefix(2)
        let visitorsSecondNumber = visitorsString[rangeStartIndex..<rangeEndIndex]
        let visitorsThridNumber = visitorsString.suffix(3)
        
        visitorLabel.text = "\(visitorsFristNumber),\(visitorsSecondNumber),\(visitorsThridNumber) 명"
        
    }

}

