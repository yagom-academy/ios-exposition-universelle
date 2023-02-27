//
//  Expo1900 - ExpoViewController.swift
//  Created by 리지, Rowan.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var numberOfVisitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private var flagImageViews: [UIImageView]!
    @IBOutlet private weak var goButton: UIButton!
    private var expoUniverselle: ExpoUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        decodeExpoData()
        setMainScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setNavigationBar() {
        let navigationBarTitle = "메인"
        self.navigationItem.title = navigationBarTitle
    }
    
    private func decodeExpoData() {
        self.expoUniverselle = DecodeManager.decodeData(
            of: AssetName.expo, type: ExpoUniverselle.self
        ) ?? nil
    }
    
    private func setMainScene() {
        guard let expoData = self.expoUniverselle else { return }
        
        setImages()
        setLabels(from: expoData)
    }
    
    private func setImages() {
        guard let poster = UIImage(named: AssetName.poster),
              let flag = UIImage(named: AssetName.flag) else { return }
        
        self.posterImageView.image = poster
        self.flagImageViews.forEach { $0.image = flag }
    }
    
    private func setLabels(from expoData: ExpoUniverselle) {
        guard let decimalVisitors = convertToDecimal(
            from: expoData.numberOfVisitors
        ) else { return }
        
        numberOfVisitorLabel.text = "방문객 : \(decimalVisitors) 명"
        locationLabel.text = "개최지 : \(expoData.location)"
        durationLabel.text = "개최 기간 : \(expoData.duration)"
        
        convertTextSize(of: numberOfVisitorLabel, range: NSMakeRange(0, 3))
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
    
    @IBAction private func touchUpGoButton(_ sender: UIButton) {
        let identifier = "ItemEntryViewController"
        guard let nextViewController = self.storyboard?.instantiateViewController(
            withIdentifier: identifier
        ) else { return }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private enum AssetName {
        static let expo = "exposition_universelle_1900"
        static let poster = "poster"
        static let flag = "flag"
    }
}

