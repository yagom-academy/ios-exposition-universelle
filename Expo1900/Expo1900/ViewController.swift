//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var numberOfVisitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var openingPeriodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var exposition: ExpoItem
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition") else {
            return
        }
        
        do {
            exposition = try jsonDecoder.decode(ExpoItem.self, from: dataAsset.data)
            expoTitleLabel.text = String(exposition.expoTitle)
            numberOfVisitorsLabel.text = String(exposition.numberOfVisitors)
            locationLabel.text = String(exposition.location)
            openingPeriodLabel.text = String(exposition.openingPeriod)
            descriptionLabel.text = String(exposition.description)
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    

}
