//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var expositionTitle: UILabel!
    @IBOutlet var visiter: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var detailDescription: UILabel!
    
     private func ExpositionUniverselle1900() throws {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { throw ExpositionError.noFile }
        guard let expo = try? jsonDecoder.decode(Exposition.self, from: dataAsset.data) else {
            throw ExpositionError.decodeFailed
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        expositionTitle.text = expo.title
        visiter.text = "방문객 : " + "\(expo.visitors)"
        location.text = "개최지 : " + expo.location
        duration.text = "개최 기간 : " + expo.duration
        detailDescription.text = expo.description
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try? ExpositionUniverselle1900()
        } catch {
            print("ExpositionUniverselleError")
        
        
        }
    }
}

