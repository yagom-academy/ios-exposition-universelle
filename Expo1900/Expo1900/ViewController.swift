//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var infos: ExhibitionInfomation?
        let jsonDecoder = JSONDecoder()
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            infos = try jsonDecoder.decode(ExhibitionInfomation.self, from: jsonData.data)
        } catch {
            print("error")
        }
        print(infos?.title)
    }
}

