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
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(
            name: ExpoConstant.Expo1900JSONFileName) else {
            return
        }
        
        do {
            self.expositionUniverselle = try jsonDecoder.decode(ExpositionUniverselle.self,
                                                                from: dataAsset.data)
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
        let location: String = expositionUniverselle.location.expoLocationImformation
        let duration: String = expositionUniverselle.duration.expoDurationInformation
        
        titleLabel.text = expositionUniverselle.title.applyLineBreak()
        titleLabel.font = ExpoConstant.largeFont
        visitorsLabel.attributedText = visitors.createAttributed(target: ExpoConstant.visitor)
        locationLabel.attributedText = location.createAttributed(target: ExpoConstant.location)
        durationLabel.attributedText = duration.createAttributed(target: ExpoConstant.duration)
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

