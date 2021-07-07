//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    let assetFileName = "exposition_universelle_1900"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}

extension MainViewController: JSONDecodable {
    typealias T = Exposition
    
    func getExposition() -> Exposition? {
        return try? decodeJSON(fileName: assetFileName)
    }
    
    func initView() {
        guard let currentExposition = getExposition() else {
            return
        }
        let titleText = formattingTitle(title: currentExposition.title)
        let visitorsText = formattingVisitors(visitors: currentExposition.visitors)
        titleLabel.text = titleText
        visitorsLabel.text = visitorsText
        locationLabel.text = currentExposition.location
        durationLabel.text = currentExposition.duration
        descriptionLabel.text = currentExposition.description
    }
    
    func formattingTitle(title: String) -> String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
    
    func formattingVisitors(visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: visitors)) ?? "0"
    }
}
