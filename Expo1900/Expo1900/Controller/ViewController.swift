//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorValueLabel: UILabel!
    @IBOutlet weak var locationValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsToDefault()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setViewsToDefault() {
        do {
            let data = try Parser.parsedExpoInfo()
            titleLabel.text = data.formattedTitle
            visitorValueLabel.text = data.formattedVisitors
            locationValueLabel.text = data.location
            durationValueLabel.text = data.duration
            titleLabel.font = UIFont.systemFont(ofSize: 28)
            setTextViewToDefault(with: data.description)
        } catch let error {
            print(error)
        }
    }
    
    private func setTextViewToDefault(with data: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakStrategy = .hangulWordPriority
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .paragraphStyle: paragraphStyle]
        descriptionTextView.attributedText = NSAttributedString(
            string: data.description,
            attributes: attribute)
        descriptionTextView.textAlignment = .left
    }
}
