//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
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
        
        testLabel.text = expositionIntroduction.title
    }

}

