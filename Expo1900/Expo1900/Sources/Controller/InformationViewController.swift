//
//  Expo1900 - InformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InformationViewController: UIViewController {
    private var information: Exposition?
    
    @IBOutlet weak private var titleOfExposition: UILabel!
    @IBOutlet weak private var numberOfVisitors: UILabel!
    @IBOutlet weak private var location: UILabel!
    @IBOutlet weak private var duration: UILabel!
    @IBOutlet weak private var descriptionOfExposition: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeDataAsset(name: Constant.expositionAssetName)
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        configureNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.backButtonTitle = Constant.mainBackButtonTitle
    }
    
    private func decodeDataAsset(name: String) {
        guard let information = JSONDecoder.decodeAsset(name: name, to: Exposition.self) else {
            return
        }
        
        self.information = information
    }
    
    private func configureLabels() {
        titleOfExposition.text = information?.title
        numberOfVisitors.attributedText = attributedString(of: information?.numberOfVisitors)
        location.attributedText = attributedString(of: information?.location)
        duration.attributedText = attributedString(of: information?.duration)
        descriptionOfExposition.text = information?.description
    }
    
    private func attributedString(of text: String?) -> NSMutableAttributedString? {
        guard let text = text,
              let leftText = text.split(separator: Constant.colon).first else {
            return nil
        }
        let leftTextFont: UIFont = UIFont.systemFont(ofSize: 20)
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.font, value: leftTextFont, range: NSRange(location: 0, length: leftText.count))
        
        return attributedString
    }
}
