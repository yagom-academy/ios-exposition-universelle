//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    private var koreaExhibitItems: [KoreaExhibitItem] = []
    private var expo1900Information = Expo1900Information(title: "", visitors: 0, location: "", duration: "", description: "")
    
    override func viewDidLoad() {
        let jsonDecoder = JSONDecoder()
        
        guard let koreaExhibitItemsData = NSDataAsset(name: "items"),
              let expo1900InformationData = NSDataAsset(name: "exposition_universelle_1900")
        else { return }
        
        do {
            koreaExhibitItems = try jsonDecoder.decode([KoreaExhibitItem].self, from: koreaExhibitItemsData.data)
            expo1900Information = try jsonDecoder.decode(Expo1900Information.self, from: expo1900InformationData.data)
        } catch  {
            print("Error")
        }
        print(koreaExhibitItems)
        print(expo1900Information)
    }
}
