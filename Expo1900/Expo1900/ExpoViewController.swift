//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet var flags: [UIImageView]!
    @IBOutlet weak var goButton: UIButton!
    private var expoUniverselle: ExpoUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpoData()
        setMainScene()
    }
    
    private func decodeExpoData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            self.expoUniverselle = try jsonDecoder.decode(ExpoUniverselle.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setMainScene() {
        guard let expoData = self.expoUniverselle else { return }
        
        setImages()
        setLabels(from: expoData)
    }
    
    private func setImages() {
        guard let poster = UIImage(named: "poster"),
              let flag = UIImage(named: "flag") else { return }
        
        self.posterImage.image = poster
        self.flags.forEach { $0.image = flag }
    }
    
    private func setLabels(from expoData: ExpoUniverselle) {
        guard let decimalVisitors = convertToDecimal(from: expoData.visitors) else { return }
        
        visitorLabel.text = "방문객 : \(decimalVisitors) 명"
        locationLabel.text = "개최지 : \(expoData.location)"
        durationLabel.text = "개최 기간 : \(expoData.duration)"
        
        convertTextSize(of: visitorLabel, range: NSMakeRange(0, 3))
        convertTextSize(of: locationLabel, range: NSMakeRange(0, 3))
        convertTextSize(of: durationLabel, range: NSMakeRange(0, 5))
        
        self.titleLabel.text = expoData.title
        self.descriptionLabel.text = expoData.description
    }
    
    private func convertToDecimal(from visitors: Int) -> String? {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        
        guard let decimalVisitors = numberformatter.string(for: visitors) else { return nil }
        
        return decimalVisitors
    }
    
    private func convertTextSize(of label: UILabel, range: NSRange) {
        guard let target = label.text else { return }
        
        let fontSize = UIFont.systemFont(ofSize: 20)
        let attributedString = NSMutableAttributedString(string: target)
        
        attributedString.addAttribute(.font, value: fontSize, range: range)
        label.attributedText = attributedString
    }
}

