//
//  Expo1900 - ViewController.swift
//  Created by Christy, Rhode. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var items: [ExhibitItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let assetItem = NSDataAsset.init(name: "items") else {
            return
        }
        let decoder = JSONDecoder()
        
        do {
            self.items = try decoder.decode([ExhibitItem].self, from: assetItem.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
