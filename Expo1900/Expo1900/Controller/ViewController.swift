//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var expoItem: UIImageView!
    @IBOutlet weak var expoVisitors: UILabel!
    @IBOutlet weak var expoLocation: UILabel!
    @IBOutlet weak var expoDuration: UILabel!
    @IBOutlet weak var expoDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        
        let decoder = JSONDecoder()
        
        var product: Exposition.ExpositionInfo?
        
        do {
            product = try decoder.decode(Exposition.ExpositionInfo.self, from: asset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        print(product!.title)
    }
}

