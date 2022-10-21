//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var expositionUniverselle: ExpositionUniverselle?
    private let jsonDecodingManager: JSONDecodingManager = JSONDecodingManager()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = ExpoConstant.mainNavigationTitle
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpoInformation()
        setTextToDisplay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpoInformation() {
        do {
            expositionUniverselle = try jsonDecodingManager.decode(
                dataAsset: ExpoConstant.Expo1900JSONFileName)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setTextToDisplay() {
        guard let expositionUniverselle = expositionUniverselle else {
            return
        }
        let formattedVisitor: String = changeNumberFormat(
            number:"\(expositionUniverselle.visitors)")
        
        let visitors: String = formattedVisitor.expoVisitorInformation
        let location: String = expositionUniverselle.location.expoLocationInformation
        let duration: String = expositionUniverselle.duration.expoDurationInformation
        
        titleLabel.text = expositionUniverselle.title.applyLineBreak()
        titleLabel.font = ExpoConstant.largeFont
        visitorsLabel.attributedText = visitors.createAttributed(target: ExpoConstant.visitor,
                                                                 key: .font,
                                                                 value: ExpoConstant.mediumFont)
        locationLabel.attributedText = location.createAttributed(target: ExpoConstant.location,
                                                                 key: .font,
                                                                 value: ExpoConstant.mediumFont)
        durationLabel.attributedText = duration.createAttributed(target: ExpoConstant.duration,
                                                                 key: .font,
                                                                 value: ExpoConstant.mediumFont)
        descriptionTextView.text = expositionUniverselle.description
    }
    
    private func changeNumberFormat(number: String) -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let decimalNumber = Double(number) else {
            return number
        }
        return formatter.string(from: NSNumber(value: decimalNumber))!
    }
}

fileprivate extension String {
    var expoVisitorInformation: String {
        return ExpoConstant.visitor + ExpoConstant.colon + self + ExpoConstant.people
    }
    
    var expoLocationInformation: String {
        return ExpoConstant.location + ExpoConstant.colon + self
    }
    
    var expoDurationInformation: String {
        return ExpoConstant.duration + ExpoConstant.colon + self
    }
    
    func createAttributed(target: String, key: NSAttributedString.Key, value: Any) -> NSAttributedString {
        let attributed: NSMutableAttributedString = NSMutableAttributedString(string: self)
        let targetRange = (self as NSString).range(of: target)
        attributed.addAttribute(key, value: value, range: targetRange)
        
        return attributed
    }
    
    func applyLineBreak() -> String {
        return self.split(separator: ExpoConstant.leftBracket).joined(separator: "\n(")
    }
}
