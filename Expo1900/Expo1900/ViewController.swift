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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        do {
            let result = try jsonDecoder.decode(ParisExpositionInformation.self, from: dataAsset.data)
            setLabels(from: result)
        } catch {
            print(error)
        }
    }
    
    private func setLabels(from result: ParisExpositionInformation) {
        setTitleLabel(result.title)
        setVisitorsLabel(result.visitors)
        setLocationLabel(result.location)
        setDurationLabel(result.duration)
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
        let text = setEachFontsize(text: String(visitors) + " 명", prefix)
        visitorsLabel.attributedText = text
    }
    
    private func setLocationLabel(_ location: String) {
        let prefix = "개최지 : "
        let text = setEachFontsize(text: location, prefix)
        locationLabel.attributedText = text
    }
    
    private func setDurationLabel(_ duration: String) {
        let prefix = "개최 기간 : "
        let text = setEachFontsize(text: duration, prefix)
        durationLabel.attributedText = text
    }
    
    private func setEachFontsize(text: String, _ prefix: String) -> NSMutableAttributedString {
        let fontSize = UIFont.boldSystemFont(ofSize: 20)
        let attributedStr = NSMutableAttributedString(string: prefix + String(text))
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: fontSize, range: NSMakeRange(0, prefix.count))
        return attributedStr
    }
    
    @IBAction private func touchUpKoreanExpositionItem() {
        guard let koreaExpositionListViewController = self.storyboard?.instantiateViewController(identifier: "KoreaExpositionList") else {
            return
        }
        self.navigationController?.pushViewController(koreaExpositionListViewController, animated: true)
    }
}

