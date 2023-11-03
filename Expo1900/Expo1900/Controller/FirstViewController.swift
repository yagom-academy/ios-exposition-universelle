//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet var buttonImages: [UIImageView]!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.scrollRectToVisible(titleLabel.frame, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let CulturalAssetListViewController = storyboard?.instantiateViewController(identifier: String(describing: CulturalAssetListViewController.self)) as? CulturalAssetListViewController else {
            return
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        navigationController?.pushViewController(CulturalAssetListViewController, animated: true)
    }
    
    func configureUI() {
        guard let exposition = decodeDataAsset() else {
            return
        }
        
        titleLabel.text = exposition.formattingTitle
        imageView.image = UIImage(named: "poster")
        visitorsLabel.text = exposition.formattingVisitors
        locationLabel.text = exposition.formattingLocation
        durationLabel.text = exposition.formattingduration
        explanationLabel.text = exposition.explanation
        
        visitorsLabel.changeFontSize(targetString: "방문객")
        locationLabel.changeFontSize(targetString: "개최지")
        durationLabel.changeFontSize(targetString: "개최 기간")

        buttonImages[0].image = UIImage(named: "flag")
        buttonImages[1].image = UIImage(named: "flag")
    }
    
    func decodeDataAsset() -> Exposition? {
        let decoder = JSONDecoder()

        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }

        return try? decoder.decode(Exposition.self, from: dataAsset.data)
    }
}

extension UILabel {
    func changeFontSize(targetString: String) {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: ((self.text ?? "") as NSString).range(of: targetString))
        
        self.attributedText = attributedString
    }
}
