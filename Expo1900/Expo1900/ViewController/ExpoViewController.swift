//
//  Expo1900 - ExpoViewController.swift
//  Created by 리지, Rowan.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberOfVisitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet var flags: [UIImageView]!
    @IBOutlet weak var goButton: UIButton!
    private var expoUniverselle: ExpoUniverselle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NavigationBarTitle.main
        decodeExpoData()
        setMainScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeExpoData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: AssetName.expo) else { return }
        
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
        guard let poster = UIImage(named: AssetName.poster),
              let flag = UIImage(named: AssetName.flag) else { return }
        
        self.posterImage.image = poster
        self.flags.forEach { $0.image = flag }
    }
    
    private func setLabels(from expoData: ExpoUniverselle) {
        guard let decimalVisitors = convertToDecimal(from: expoData.numberOfVisitors) else { return }
        
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
    
    @IBAction func touchUpGoButton(_ sender: UIButton) {
        guard let nextViewController = self.storyboard?.instantiateViewController(
            withIdentifier: Identifier.itemEntryViewController
        ) else { return }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

