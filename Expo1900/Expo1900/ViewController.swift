//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var visitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var openPeriod: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var exposition: MainExposition?
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            exposition = try jsonDecoder.decode(MainExposition.self, from: jsonData.data)
        } catch {
            print("catch")
        }
        print(exposition)
        
        
        mainTitle.text = exposition?.title
        visitors.text = exposition?.visitors.description
        location.text = exposition?.location
        openPeriod.text = exposition?.duration
        textLabel.text = exposition?.description
    }


}

