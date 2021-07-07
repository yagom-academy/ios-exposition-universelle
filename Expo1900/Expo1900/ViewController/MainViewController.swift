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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        styleLabelHeaders()
    }
}

extension MainViewController: JSONDecodable {
    typealias T = Exposition
    
    func getExposition() -> Exposition? {
        return try? decodeJSON(fileName: .expositionFileName)
    }
    
    func initView() {
        guard let currentExposition = getExposition() else {
            return
        }
        let titleText = formattingTitle(title: currentExposition.title)
        let visitorsText = formattingVisitors(visitors: currentExposition.visitors)
        titleLabel.text = titleText
        visitorsLabel.text = .visitor + visitorsText + .people
        locationLabel.text = .location + currentExposition.location
        durationLabel.text = .duration + currentExposition.duration
        descriptionLabel.text = currentExposition.description
    }
    
    func formattingTitle(title: String) -> String {
        return title.replacingOccurrences(of: String.bracket, with: String.newLine + String.bracket)
    }
    
    func formattingVisitors(visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: visitors)) ?? .zero
    }
    
    func modifySize(of range: String, in label: UILabel) {
        guard let text = label.text else {
            return
        }
        
        let fontSize = UIFont.systemFont(ofSize: label.font.pointSize + 4)
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: range.replacingOccurrences(of: String.colon, with: String.blank)))
        
        label.attributedText = attributedStr
    }
    
    func styleLabelHeaders() {
        modifySize(of: .visitor , in: visitorsLabel)
        modifySize(of: .location , in: locationLabel)
        modifySize(of: .duration , in: durationLabel)
    }
}
