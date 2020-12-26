//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var discriptionTextView: UITextView!
    
    var expositionParis: ExpositionParis!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            self.expositionParis = try jsonDecoder.decode(ExpositionParis.self, from: dataAsset.data)
        } catch {
            debugPrint("Error")
        }
        
        setTitle()
        
        visitorLabel.text = String(expositionParis.visitors)
        locationLabel.text = expositionParis.location
        durationLabel.text = expositionParis.duration
        discriptionTextView.text = expositionParis.description
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func setTitle() {
        let title: [String] = expositionParis.title.components(separatedBy: "(")
        titleLabel.text = title[0] + "\n(" + title[1]
        titleLabel.numberOfLines = 0
    }
}
