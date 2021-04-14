//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
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
            print(exposition.expoTitle)
            print(exposition.description)
            print(exposition.location)
            print(exposition.numberOfVisitors)
            print(exposition.openingPeriod)
        } catch {
            print(error.localizedDescription)
        }
    }
}
