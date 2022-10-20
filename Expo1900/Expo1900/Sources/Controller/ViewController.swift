//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleOfExposition: UILabel!
    @IBOutlet weak var numberOfVisitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var descriptionOfExposition: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let expositionAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            let informationOfExposition: Exposition = try jsonDecoder.decode(Exposition.self, from: expositionAsset.data)
            configureLables(informationOfExposition)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func configureLables(_ information: Exposition) {
        titleOfExposition.text = information.title
        numberOfVisitors.text = String(information.numberOfVisitors)
        location.text = information.location
        duration.text = information.duration
        descriptionOfExposition.text = information.description
    }
}
