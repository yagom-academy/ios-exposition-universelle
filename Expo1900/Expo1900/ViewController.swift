//
//  Expo1900 - ViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

class ViewController: UIViewController {
    var expoInformation: [ExpoInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decoder: JSONDecoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else { return }

        do {
            expoInformation = try decoder.decode([ExpoInformation].self, from: asset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
