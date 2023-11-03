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
        
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let CulturalAssetListViewController = storyboard?.instantiateViewController(identifier: String(describing: CulturalAssetListViewController.self)) as? CulturalAssetListViewController else {
            return
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        navigationController?.pushViewController(CulturalAssetListViewController, animated: true)
    }
    
    func configureUI() {
        guard let exposition = decodeDataAsset() else {
            return
        }
        
        titleLabel.text = exposition.formattingTitle
        imageView.image = UIImage(named: "poster")
        visitorsLabel.text = exposition.formattingVisitors
        locationLabel.text = exposition.formattingLocation
        durationLabel.text = exposition.formattingduration
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

