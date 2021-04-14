//
//  ExpoListViewController.swift
//  Expo1900
//
//  Created by TORI on 2021/04/14.
//

import UIKit

class ExpoListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeExpoItem()
    }
    
    func decodeExpoItem() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "items") else {
            return
        }
        let data = dataAsset.data
        
        do {
            let result = try decoder.decode([ExpoItem].self, from: data)
            print(result[0])
        } catch {
            print("parsing failed")
        }
    }
}
