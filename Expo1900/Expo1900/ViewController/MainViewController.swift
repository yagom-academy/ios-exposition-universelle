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

extension MainViewController {
    private func initView() {
        let currentExposition = ParsedExposition()
        titleLabel.text = currentExposition.title
        visitorsLabel.text = currentExposition.visitors
        locationLabel.text = currentExposition.location
        durationLabel.text = currentExposition.duration
        descriptionLabel.text = currentExposition.description
    }
    
    private func styleLabelHeaders() {
        modifySize(of: ParsedExposition.Prefix.visitor , in: visitorsLabel)
        modifySize(of: ParsedExposition.Prefix.location , in: locationLabel)
        modifySize(of: ParsedExposition.Prefix.duration , in: durationLabel)
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

extension UINavigationController {
    open override var shouldAutorotate: Bool {
        if self.topViewController is MainViewController {
            return false
        }
        return true
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
