//
//  Expo1900 - InformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InformationViewController: UIViewController {
    private var information: Exposition?
    
    @IBOutlet weak var titleOfExposition: UILabel!
    @IBOutlet weak var numberOfVisitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var descriptionOfExposition: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeDataAsset(name: "exposition_universelle_1900")
        configureLables()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        configureLables()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.backButtonTitle = "메인"
    }
    
    private func decodeDataAsset(name: String) {
        guard let information = JSONDecoder.decodeAsset(name: name, to: Exposition.self) else {
            return
        }
        
        self.information = information
    }
    
    private func configureLables() {
        titleOfExposition.text = information?.title
        numberOfVisitors.attributedText = attributedString(of: information?.numberOfVisitors)
        location.attributedText = attributedString(of: information?.location)
        duration.attributedText = attributedString(of: information?.duration)
        descriptionOfExposition.text = information?.description
    }
    
    private func attributedString(of text: String?) -> NSMutableAttributedString? {
        guard let text = text,
              let leftText = text.split(separator: ":").first else {
            return nil
        }
        let leftTextFont: UIFont = UIFont.systemFont(ofSize: 20)
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.font, value: leftTextFont, range: NSRange(location: 0, length: leftText.count))
        
        return attributedString
    }
}
