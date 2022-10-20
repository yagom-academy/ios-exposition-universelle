//
//  Expo1900 - InformationViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet weak var titleOfExposition: UILabel!
    @IBOutlet weak var numberOfVisitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var descriptionOfExposition: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let expositionAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            let informationOfExposition: Exposition = try jsonDecoder.decode(Exposition.self, from: expositionAsset.data)
            configureLables(informationOfExposition)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func configureLables(_ information: Exposition) {
        titleOfExposition.text = adjustTitleText(information.title)
        numberOfVisitors.attributedText = attributedString("방문객 : \(formattedNumber(information.numberOfVisitors)) 명")
        location.attributedText = attributedString("개최지 : \(information.location)")
        duration.attributedText = attributedString("개최 기간 : \(information.duration)")
        descriptionOfExposition.text = information.description
    }
    
    func adjustTitleText(_ text: String) -> String {
        var title: String = text
        guard let firstLine = title.split(separator: "(").first else {
            return title
        }
        title.removeFirst(firstLine.count)
        let secondLine: String = title
        return firstLine + "\n" + secondLine
    }
    
    func formattedNumber(_ number: Int) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let visitors = numberFormatter.string(from: NSNumber(value: number)) else {
            return String(number)
        }
        return visitors
    }
    
    func attributedString(_ text: String) -> NSMutableAttributedString? {
        guard let leftText = text.split(separator: ":").first else {
            return nil
        }
        let leftFont: UIFont = UIFont.systemFont(ofSize: 20)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: leftFont, range: NSRange(location: 0, length: leftText.count))
        return attributedString
    }
}
