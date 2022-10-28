//
//  Expo1900 - ExpositionUniverselleViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionUniverselleViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var expositionUniverselle: ExpositionUniverselle?
    private let jsonDecodingManager: JSONDecodingManager = JSONDecodingManager()
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if navigationController?.topViewController is ExpositionUniverselleViewController {
            return .portrait
        }
        return .all
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ExpoConstant.mainNavigationTitle
        let orientation = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(orientation, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpoInformation()
        setTextToDisplay()
        navigationController?.delegate = self
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
    
    private func setupUI() {
        guard let expositionUniverselle = expositionUniverselle else {
            descriptionLabel.text = "데이터를 불러오는데 실패했습니다."
            return
        }
        
        let formattedVisitor: String = changeNumberFormat(
            number:"\(expositionUniverselle.visitors)")
        
        let visitors: String = formattedVisitor.expoVisitorInformation
        let location: String = expositionUniverselle.location.expoLocationInformation
        let duration: String = expositionUniverselle.duration.expoDurationInformation
        
        
        titleLabel.text = expositionUniverselle.title.applyLineBreak()
        visitorsLabel.attributedText = visitors.makeLabelString(
            prefix: ExpoConstant.visitor,
            text: ExpoConstant.colon + formattedVisitor + ExpoConstant.people
        )
        locationLabel.attributedText = location.makeLabelString(
            prefix: ExpoConstant.location,
            text: ExpoConstant.colon + expositionUniverselle.location
        )
        durationLabel.attributedText = duration.makeLabelString(
            prefix: ExpoConstant.duration,
            text: ExpoConstant.colon + expositionUniverselle.duration
        )
        descriptionLabel.text = expositionUniverselle.description
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

extension ExpositionUniverselleViewController: UINavigationControllerDelegate {
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return self.supportedInterfaceOrientations
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
    
    func makeLabelString(prefix: String, text: String) -> NSAttributedString {
        return createAttributed(target: [prefix, text], key: .font, value: [ExpoConstant.largeFont, ExpoConstant.mediumFont])
    }
    
    func createAttributed(target: [String], key: NSAttributedString.Key, value: [Any]) -> NSAttributedString {
        let attributed: NSMutableAttributedString = NSMutableAttributedString(string: self)
        zip(target, value).forEach { (target, value) in
            let targetRange = (self as NSString).range(of: target)
            attributed.addAttribute(key, value: value, range: targetRange)
        }
        
        return attributed
    }
    
    func applyLineBreak() -> String {
        return self.split(separator: ExpoConstant.leftBracket).joined(separator: "\n(")
    }
}
