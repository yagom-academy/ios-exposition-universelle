//
//  Expo1900 - InformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class InformationViewController: UIViewController {
    private var information: Exposition?
    
    @IBOutlet private weak var titleOfExposition: UILabel!
    @IBOutlet private weak var numberOfVisitors: UILabel!
    @IBOutlet private weak var location: UILabel!
    @IBOutlet private weak var duration: UILabel!
    @IBOutlet private weak var descriptionOfExposition: UILabel!
    @IBOutlet private weak var showExhibitionListViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeDataAsset(name: Constant.expositionAssetName)
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        configureNavigationBar(hidden: true)
        setOrientation(direction: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        configureNavigationBar(hidden: false)
    }
    
    private func setOrientation(direction: UIInterfaceOrientation) {
        UIDevice.current.setValue(direction.rawValue, forKey: "orientation")
        OrientationMaskController.attemptRotationToDeviceOrientation()
    }
    
    private func configureNavigationBar(hidden: Bool) {
        if hidden {
            navigationController?.setNavigationBarHidden(true, animated: true)
            navigationItem.backButtonTitle = Constant.mainBackButtonTitle
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    private func decodeDataAsset(name: String) {
        guard let information = JSONDecoder.decodeAsset(name: name, to: Exposition.self) else {
            return
        }
        
        self.information = information
    }
    
    private func configureLabels() {
        configureAdjustFont()
        
        titleOfExposition.text = information?.title
        numberOfVisitors.attributedText = attributedString(of: information?.numberOfVisitors)
        location.attributedText = attributedString(of: information?.location)
        duration.attributedText = attributedString(of: information?.duration)
        descriptionOfExposition.text = information?.description
        showExhibitionListViewButton.titleLabel?.textAlignment = .center
    }
    
    private func configureAdjustFont() {
        titleOfExposition.adjustsFontForContentSizeCategory = true
        numberOfVisitors.adjustsFontForContentSizeCategory = true
        location.adjustsFontForContentSizeCategory = true
        duration.adjustsFontForContentSizeCategory = true
        descriptionOfExposition.adjustsFontForContentSizeCategory = true
    }
    
    private func attributedString(of text: String?) -> NSMutableAttributedString? {
        guard let text = text,
              let leftText = text.split(separator: Constant.colon).first else {
            return nil
        }
        let textFont = UIFont.preferredFont(forTextStyle: .body)
        let leftTextFont = UIFont.preferredFont(forTextStyle: .title3)
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.font, value: textFont, range: NSRange(location: 0, length: text.count))
        
        attributedString.addAttribute(.font, value: leftTextFont, range: NSRange(location: 0, length: leftText.count))
        
        return attributedString
    }
}
