//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var expositionIntroduction: ExpositionIntroduction!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionIntroduction = try jsonDecoder.decode(ExpositionIntroduction.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitorString: String = numberFormatter.string(for: expositionIntroduction.visitors) else {
            return
        }
        
        mainTitleLabel.text = String(expositionIntroduction.title.prefix(13))
        subTitleLabel.text = String(expositionIntroduction.title.suffix(28))
        posterImageView.image = UIImage(named: "poster.png")
        visitorLabel.text = "방문객: \(visitorString) 명"
        locationLabel.text = "개최지 : \(expositionIntroduction.location)"
        durationLabel.text = "개최 기간 : \(expositionIntroduction.duration)"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = expositionIntroduction.description
    }
    
    @IBAction func koreanHeritageClicked(_ sender: UIButton) {
        openKoreanHeritageViewController()
    }
    
    func openKoreanHeritageViewController() {
        guard let koreanHeritageViewController = storyboard?.instantiateViewController(withIdentifier: "KoreanHeritageViewController") as? KoreanHeritageViewController else {
            return
        }
        
        navigationController?.pushViewController(koreanHeritageViewController, animated: true)
        
        let backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }

}

