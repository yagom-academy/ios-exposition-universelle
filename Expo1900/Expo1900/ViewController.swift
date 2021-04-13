//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let decoder = Decoder()
        
        decoder.decodeAssetData(ExpositionDeParis.self, "exposition_universelle_1900")
        decoder.decodeAssetData([ExpositionItems].self, "items")
    }
}
