//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var exhibitItems: [Exhibits] = []
    var exhibitDescription: ExhibitDescription = ExhibitDescription(title: "", visitors: 0, location: "", duration: "", description: "")
    
    override func viewDidLoad() {
        let jsonDecoder = JSONDecoder()
        
        guard let itemsData = NSDataAsset(name: "items"),
              let descriptionData = NSDataAsset(name: "exposition_universelle_1900")
        else { return }
        
        do {
            exhibitItems = try jsonDecoder.decode([Exhibits].self, from: itemsData.data)
            exhibitDescription = try jsonDecoder.decode(ExhibitDescription.self, from: descriptionData.data)
        } catch  {
            print("Error")
        }
        print(exhibitDescription)
    }
}
