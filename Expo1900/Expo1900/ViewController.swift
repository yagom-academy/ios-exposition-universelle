//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var visitSpotLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - data property
    private var expositionData: Exposition? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initExpositionData()
    }
    
    // MARK: - init data
    private func initExpositionData() {
        let jsonDecoder = JSONDecoder()
        guard let expositionJsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            self.expositionData = try jsonDecoder.decode(Exposition.self, from: expositionJsonData.data)
        } catch {
            print(error)
        }
    }
}

