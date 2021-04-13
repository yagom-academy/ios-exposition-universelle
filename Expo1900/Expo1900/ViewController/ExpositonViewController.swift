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
        decodeExposition()
    }

    func decodeExposition() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { return }
        guard let exposition = try? jsonDecoder.decode(Exposition.self, from: dataAsset.data) else { return }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let visitor = numberFormatter.string(from: NSNumber(value: exposition.visitors)) else { return }
        
        expositionVisitor.text = "방문객 : " + visitor + " 명"
        expositionLocation.text = "개최지 : " + exposition.location
        expositionDuration.text = "개최 기간 : " + exposition.duration
        expositionDescription.text = exposition.description
    }
}

