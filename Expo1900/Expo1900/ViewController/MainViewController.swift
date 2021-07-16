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
    @IBOutlet weak var nextButton: UIButton!
    
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
        initTitleLabel(title: currentExposition.title)
        initVisitorLabel(parsedExposition: currentExposition)
        initDurationLabel(parsedExposition: currentExposition)
        initLocationLabel(parsedExposition: currentExposition)
        initDescriptionLabel(parsedExposition: currentExposition)
//        nextButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        nextButton.titleLabel?.adjustsFontForContentSizeCategory = true
        nextButton.titleLabel?.numberOfLines = .zero
    }
    
    private func initTitleLabel(title: String?) {
        titleLabel.text = title
        titleLabel.accessibilityLabel = NSLocalizedString("제목:", comment: "제목")
        titleLabel.accessibilityValue = NSLocalizedString(title ?? .blank, comment: "내용")
    }
    
    private func initVisitorLabel(parsedExposition: ParsedExposition) {
        let prefix = ParsedExposition.Prefix.visitor
        let value = parsedExposition.visitors?.replacingOccurrences(of: prefix, with: String.blank)
        visitorsLabel.text = parsedExposition.visitors
        visitorsLabel.accessibilityLabel = prefix
        visitorsLabel.accessibilityValue = value
    }
    
    private func initDurationLabel(parsedExposition: ParsedExposition) {
        let prefix = ParsedExposition.Prefix.duration
        let value = parsedExposition.duration?.replacingOccurrences(of: prefix, with: String.blank)
        durationLabel.text = parsedExposition.duration
        durationLabel.accessibilityLabel = prefix
        durationLabel.accessibilityValue = value
    }
    
    private func initLocationLabel(parsedExposition: ParsedExposition) {
        let prefix = ParsedExposition.Prefix.location
        let value = parsedExposition.location?.replacingOccurrences(of: prefix, with: String.blank)
        locationLabel.text = parsedExposition.location
        locationLabel.accessibilityLabel = prefix
        locationLabel.accessibilityValue = value
    }
    
    private func initDescriptionLabel(parsedExposition: ParsedExposition) {
        let prefix = "내용:"
        descriptionLabel.text = parsedExposition.description
        descriptionLabel.accessibilityLabel = prefix
        descriptionLabel.accessibilityValue = parsedExposition.description
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
        let headRange = (text as NSString)
            .range(of: range.replacingOccurrences(of: String.colonAndSpace, with: String.blank))
        let tailRange = NSRange(headRange.length...(text.count - 1))
        
        let titleFontSize = UIFont.preferredFont(forTextStyle: .title3)
        let bodyFontSize = UIFont.preferredFont(forTextStyle: .body)
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: titleFontSize, range: headRange)
        attributedString.addAttribute(.font, value: bodyFontSize, range: tailRange)
        
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
