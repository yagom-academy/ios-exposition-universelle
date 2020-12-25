//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var goKoreaExpoListButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        appDelegate?.shouldSupportAllOrientation = false
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "메인"
        decodeData()
        setDynamicFonts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        appDelegate?.shouldSupportAllOrientation = true
        super.viewWillDisappear(animated)
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            showAlert(message: ExpositionError.canNotDecodeData.localizedDescription)
            return
        }
        do {
            let result = try jsonDecoder.decode(ParisExpositionInformation.self, from: dataAsset.data)
            setAllLabelsInView(from: result)
        } catch ExpositionError.canNotDecodeData {
            showAlert(message: ExpositionError.canNotDecodeData.localizedDescription)
        } catch {
            showAlert(message: ExpositionError.unknownError.localizedDescription)
        }
    }
    
    private func setDynamicFonts() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        visitorsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        durationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        goKoreaExpoListButton?.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        goKoreaExpoListButton?.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    private func setAllLabelsInView(from result: ParisExpositionInformation) {
        setTitleLabel(result.title)
        setVisitorsLabel(result.visitors)
        let locationLabelPrefix = "개최지 : "
        locationLabel.attributedText = setLabel(from: result.location, prefix: locationLabelPrefix)
        let durationLabelPrefix = "개최 기간 : "
        durationLabel.attributedText = setLabel(from: result.duration, prefix: durationLabelPrefix)
        descriptionLabel.text = result.description
    }
    
    private func setTitleLabel(_ title: String) {
        var seperatedTitle = title.components(separatedBy: "(")
        seperatedTitle.insert("\n(", at: 1)
        var resultTitle: String = ""
        for text in seperatedTitle {
            resultTitle += text
        }
        titleLabel.text = resultTitle
    }
    
    private func setVisitorsLabel(_ visitors: UInt) {
        let prefix = "방문자 : "
        let number = putComma(in: String(visitors)) + " 명"
        let text = setEachFontsize(text: number, prefix)
        visitorsLabel.attributedText = text
    }
    
    private func setLabel(from labelContent: String, prefix: String) -> NSMutableAttributedString {
        let text = setEachFontsize(text: labelContent, prefix)
        return text
    }
    
    private func setEachFontsize(text: String, _ prefix: String) -> NSMutableAttributedString {
        let fontSize = UIFont.boldSystemFont(ofSize: 20)
        let attributedStr = NSMutableAttributedString(string: prefix + String(text))
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: fontSize, range: NSMakeRange(0, prefix.count))
        return attributedStr
    }
    
    private func putComma(in number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let doubleValue = Double(number) else {
            return number
        }
        return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? number
    }
    
    @IBAction private func touchUpKoreanExpositionItem() {
        guard let koreaExpositionListViewController = self.storyboard?.instantiateViewController(identifier: "KoreaExpositionList") else {
            showAlert(message: ExpositionError.canNotLoadView.localizedDescription)
            return
        }
        self.navigationController?.pushViewController(koreaExpositionListViewController, animated: true)
    }
}

