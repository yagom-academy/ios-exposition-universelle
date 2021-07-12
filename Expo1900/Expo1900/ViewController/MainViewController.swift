//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

extension Exposition {
    enum Prefix: CustomStringConvertible {
        case visitor
        case location
        case duration
        
        var description: String {
            switch self {
            case .visitor:
                return "방문객 : "
            case .location:
                return "개최지 : "
            case .duration:
                return "개최 기간 : "
            }
        }
    }
    
    var formattedTitle: String {
        format(title: self.title)
    }
    
    var formattedVisitor: String {
        let people = " 명"
        return Prefix.visitor.description + format(visitors: self.visitors) + people
    }
    
    var formattedLocation: String {
        Prefix.location.description + self.location
    }
    
    var formattedDuration: String {
        Prefix.duration.description + self.duration
    }
    
    private func format(title: String) -> String {
        title.replacingOccurrences(of: String.bracket,
                                          with: String.newLine + String.bracket)
    }
    
    private func format(visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: visitors)) ?? .zero
    }
}

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
        let expositionFileName = "exposition_universelle_1900"

        return try? decodeJSON(fileName: expositionFileName)
    }
}

extension MainViewController {
    private func initView() {
        guard let currentExposition = initExposition() else {
            return
        }
        titleLabel.text = currentExposition.formattedTitle
        visitorsLabel.text = currentExposition.formattedVisitor
        locationLabel.text = currentExposition.formattedLocation
        durationLabel.text = currentExposition.formattedDuration
        descriptionLabel.text = currentExposition.description
    }
    
    private func styleLabelHeaders() {
        modifySize(of: Exposition.Prefix.visitor.description , in: visitorsLabel)
        modifySize(of: Exposition.Prefix.location.description , in: locationLabel)
        modifySize(of: Exposition.Prefix.duration.description , in: durationLabel)
    }
    
    private func modifySize(of range: String, in label: UILabel) {
        guard let text = label.text else {
            return
        }
        let targetRange = (text as NSString)
            .range(of: range.replacingOccurrences(of: String.colonAndSpace, with: String.blank))
        let fontSize = UIFont.systemFont(ofSize: label.font.pointSize + 4)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: fontSize, range: targetRange)
        
        label.attributedText = attributedString
    }
}
