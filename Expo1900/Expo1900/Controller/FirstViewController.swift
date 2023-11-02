//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func decodeDataAsset() -> Exposition? {
        let decoder = JSONDecoder()

        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }

        return try? decoder.decode(Exposition.self, from: dataAsset.data)
    }
}

