//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionIntroductionViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var explanationLabel: UILabel!
    @IBOutlet private var buttonImages: [UIImageView]!
    @IBOutlet private weak var scrollView: UIScrollView!
    private var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch AssetParser<Exposition>().decodeDataAsset(assetName: "exposition_universelle_1900") {
        case .success(let data):
            exposition = data
        case .failure(let error):
            let alert = UIAlertController(title: error.localizedDescription, message: "데이터를 받아오지 못했습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "예", style: .default)
            
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.scrollRectToVisible(titleLabel.frame, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction private func buttonTapped(_ sender: UIButton) {
        guard let culturalAssetListViewController = storyboard?.instantiateViewController(identifier: String(describing: CulturalAssetListViewController.self)) as? CulturalAssetListViewController else {
            return
        }
        
        navigationController?.pushViewController(culturalAssetListViewController, animated: true)
    }
    
    private func configureUI() {
        guard let exposition = self.exposition else {
            return
        }
        
        titleLabel.text = exposition.formattingTitle
        imageView.image = UIImage(named: "poster")
        visitorsLabel.text = exposition.formattingVisitors
        locationLabel.text = exposition.formattingLocation
        durationLabel.text = exposition.formattingDuration
        explanationLabel.text = exposition.explanation
        
        changeFontSize(targetString: "방문객", targetLabel: visitorsLabel)
        changeFontSize(targetString: "개최지", targetLabel: locationLabel)
        changeFontSize(targetString: "개최 기간", targetLabel: durationLabel)

        buttonImages[0].image = UIImage(named: "flag")
        buttonImages[1].image = UIImage(named: "flag")
    }
    
    private func changeFontSize(targetString: String, targetLabel: UILabel) {
        let attributedString = NSMutableAttributedString(string: targetLabel.text ?? "")
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20), range: ((targetLabel.text ?? "") as NSString).range(of: targetString))
        
        targetLabel.attributedText = attributedString
    }
}
