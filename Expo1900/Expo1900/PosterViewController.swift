//
//  Expo1900 - PosterViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class PosterViewController: UIViewController {
    var expositionParis: ExpositionParis?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDecoding()
    }
    
    @IBAction func tapEntryButton(_ sender: UIButton) {
    }
    
    func jsonDecoding() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            expositionParis = try jsonDecoder.decode(ExpositionParis.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
