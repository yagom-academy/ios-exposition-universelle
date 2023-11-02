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
    @IBOutlet var buttonImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        // Do any additional setup after loading the view.
    }

    func configureUI() {
        guard let exposition = decodeDataAsset() else {
            return
        }
        
        titleLabel.text = exposition.title
        imageView.image = UIImage(named: "poster")
        visitorsLabel.text = "방문객 : \(exposition.visitors)"
        locationLabel.text = exposition.location
        durationLabel.text = exposition.duration
        explanationLabel.text = exposition.explanation
        
        buttonImages[0].image = UIImage(named: "flag")
        buttonImages[1].image = UIImage(named: "flag")
    }
    
    func decodeDataAsset() -> Exposition? {
        let decoder = JSONDecoder()

        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }

        return try? decoder.decode(Exposition.self, from: dataAsset.data)
    }
}

