//
//  Expo1900 - PosterViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class PosterViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var expositionParis: ExpositionParis?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var leftFlagImageView: UIImageView!
    @IBOutlet weak var rightFlagImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expositionParis = JSONDecoder.decodeData("exposition_universelle_1900", to: ExpositionParis.self)
        
        configureViewFromDecodedData()
        configureViewFromImageAsset()
    }
    
    func configureViewFromDecodedData() {
        if let bindedTitle = expositionParis?.title, let bindedVisitors = expositionParis?.visitors {
            titleLabel.text = splitParagraph(of: bindedTitle)
            do {
                visitorsLabel.text = "\(try formatNumber(num: bindedVisitors)) 명"
            } catch {
                print("emptyError")
            }
            locationLabel.text = expositionParis?.location
            durationLabel.text = expositionParis?.duration
            descriptionLabel.text = expositionParis?.description
        }
    }
    
    func configureViewFromImageAsset() {
        posterImageView.image = UIImage(named: "poster")
        leftFlagImageView.image = UIImage(named: "flag")
        rightFlagImageView.image = UIImage(named: "flag")
    }
    
    func splitParagraph(of title: String) -> String {
        var separatedTexts = title.components(separatedBy: "(")
        separatedTexts.insert("\n(", at: 1)
        
        return separatedTexts.joined()
    }
    
    func formatNumber(num: Int) throws -> String {
        let dataformatter = NumberFormatter()
        dataformatter.numberStyle = .decimal
        
        guard let result = dataformatter.string(for: num) else {
            throw FormatterError.emptyError
        }
        
        return result
    }
}
