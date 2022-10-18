//
//  Expo1900 - PosterViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class PosterViewController: UIViewController {
    var expositionParis: ExpositionParis?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDecoding()
        configureViewFromDecodedData()
    }
    
    @IBAction func tapEntryButton(_ sender: UIButton) {
    }
    
    func jsonDecoding() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            expositionParis = try jsonDecoder.decode(ExpositionParis.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func configureViewFromDecodedData() {
        guard let bindedTitle = expositionParis?.title else { return }
        guard let bindedVisitors = expositionParis?.visitors else { return }
        
        titleLabel.text = splitParagraph(of: bindedTitle)
        posterImageView.image = UIImage(named: "poster")
        visitorsLabel.text = "\(formatNumber(num: bindedVisitors)) 명"
        locationLabel.text = expositionParis?.location
        durationLabel.text = expositionParis?.duration
        descriptionLabel.text = expositionParis?.description
    }
    
    func splitParagraph(of title: String) -> String {
        var separatedTexts = title.components(separatedBy: "(")
        separatedTexts.insert("\n(", at: 1)
        
        return separatedTexts.joined()
    }
    
    func formatNumber(num: Int) -> String {
        let dataformatter = NumberFormatter()
        dataformatter.numberStyle = .decimal
        
        guard let result = dataformatter.string(for: num) else {
            return "Formatter Error"
        }
        
        return result
    }
}
