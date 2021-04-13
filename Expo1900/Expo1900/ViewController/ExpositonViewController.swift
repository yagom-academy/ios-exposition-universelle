//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet weak var expositionTitle: UILabel!
    @IBOutlet weak var expositionVisitor: UILabel!
    @IBOutlet weak var expositionLocation: UILabel!
    @IBOutlet weak var expositionDuration: UILabel!
    @IBOutlet weak var expositionDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try decodeExposition()
        } catch {
            print("decodeExpositionError")
        }
    }

    func decodeExposition() throws {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { throw ExpositionError.readFile}
        guard let exposition = try? jsonDecoder.decode(Exposition.self, from: dataAsset.data) else { throw ExpositionError.decodeData }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let visitor = numberFormatter.string(from: NSNumber(value: exposition.visitors)) else { throw ExpositionError.numberToString }
        
        expositionVisitor.text = "방문객 : " + visitor + " 명"
        expositionLocation.text = "개최지 : " + exposition.location
        expositionDuration.text = "개최 기간 : " + exposition.duration
        expositionDescription.text = exposition.description
    }
}

