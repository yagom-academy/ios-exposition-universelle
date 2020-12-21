//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    var parisExposition: Exposition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeData()
    }
    
    private func decodeData() {
        let jsonDecoder = JSONDecoder()
        
    }
}

