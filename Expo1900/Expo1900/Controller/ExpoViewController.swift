//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoPosterImageView: UIImageView!
    @IBOutlet weak var expoVisitorsLabel: UILabel!
    @IBOutlet weak var expoLocationLabel: UILabel!
    @IBOutlet weak var expoDurationLabel: UILabel!
    @IBOutlet weak var expoDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            let expoInformation = try jsonDecoder.decode(ExpoInformation.self, from: dataAsset.data)
            expoTitleLabel.text = expoInformation.title
            expoPosterImageView.image = UIImage(named: "poster")
            expoVisitorsLabel.text = "방문객 : \(expoInformation.visitors)"
            expoLocationLabel.text = "개최지 : \(expoInformation.location)"
            expoDurationLabel.text = "개최기간: \(expoInformation.duration)"
            expoDescriptionLabel.text = expoInformation.expoDescription
        } catch {
            print("디코더 오류")
        }
        
        
    }

    @IBAction func TapEntryPageButton(_ sender: UIButton) {
        guard let entryViewController = storyboard?.instantiateViewController(withIdentifier: "entryViewController") as? EntryViewController else { return }
        
        navigationController?.pushViewController(entryViewController, animated: true)
    }
    
}

