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
        
        var infos: [ExhibitInformation] = []
        let jsonDecoder = JSONDecoder()
        guard let jsonData: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            infos = try jsonDecoder.decode([ExhibitInformation].self, from: jsonData.data)
        } catch {
            print("error")
        }
        for info in infos {
            print("name:", info.name)
            print("imageName:", info.imageName)
            print("shortdesc:", info.shortDescription)
        }
    }
}

