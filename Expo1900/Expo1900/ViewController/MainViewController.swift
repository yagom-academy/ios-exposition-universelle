//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        styleLabelHeaders()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension MainViewController: JSONDecodable {
    typealias JSONModel = Exposition
    
    private func initExposition() -> Exposition? {
        return try? decodeJSON(fileName: .expositionFileName)
    }
}

extension MainViewController {
    private func initView() {
        guard let currentExposition = initExposition() else {
            return
        }
        let titleText = format(title: currentExposition.title)
        let visitorsText = format(visitors: currentExposition.visitors)
        titleLabel.text = titleText
        visitorsLabel.text = .visitor + visitorsText + .people
        locationLabel.text = .location + currentExposition.location
        durationLabel.text = .duration + currentExposition.duration
        descriptionLabel.text = currentExposition.description
    }
    
    private func format(title: String) -> String {
        return title.replacingOccurrences(of: String.bracket,
                                          with: String.newLine + String.bracket)
    }
    
    private func format(visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: visitors)) ?? .zero
    }
    
    private func styleLabelHeaders() {
        modifySize(of: .visitor , in: visitorsLabel)
        modifySize(of: .location , in: locationLabel)
        modifySize(of: .duration , in: durationLabel)
    }
    
    private func modifySize(of range: String, in label: UILabel) {
        guard let text = label.text else {
            return
        }
        let targetRange = (text as NSString)
            .range(of: range.replacingOccurrences(of: String.colon, with: String.blank))
        let fontSize = UIFont.systemFont(ofSize: label.font.pointSize + 4)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: fontSize, range: targetRange)
        
        label.attributedText = attributedString
    }
}
