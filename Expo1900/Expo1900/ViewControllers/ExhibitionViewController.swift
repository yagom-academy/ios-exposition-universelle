//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExhibitionViewController: UIViewController {
    
    @IBOutlet weak var exhibitionTitleLabel: UILabel!
    @IBOutlet weak var exhibitionPosterImage: UIImageView!
    @IBOutlet weak var exhibitionVisitorsLabel: UILabel!
    @IBOutlet weak var exhibitionVenueLabel: UILabel!
    @IBOutlet weak var exhibitionHoldingPeriodLabel: UILabel!
    @IBOutlet weak var exhibitionDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        self.navigationItem.backButtonTitle = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func initValues() {
        let jsonDecoder = JSONDecoder()
        
        guard let exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        guard let exhibitionInfomation = try? jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData.data) else { return }
        
        exhibitionTitleLabel.text = exhibitionInfomation.newlineTitle
        exhibitionTitleLabel.textAlignment = .center
        
        exhibitionVisitorsLabel.text = "방문객 : " + exhibitionInfomation.formattedVistorsNumber + " 명"
        exhibitionVenueLabel.text = "개최지 : " + exhibitionInfomation.location
        exhibitionHoldingPeriodLabel.text = "개최기간 : " + exhibitionInfomation.duration
        
        changeFont(from: exhibitionVisitorsLabel, applyText: "방문객")
        changeFont(from: exhibitionVenueLabel, applyText: "개최지")
        changeFont(from: exhibitionHoldingPeriodLabel, applyText: "개최기간")
        
        exhibitionDescriptionLabel.text = exhibitionInfomation.description
    }
    
    private func changeFont(from label: UILabel, applyText: String) {
        guard let text = label.text else { return }
        let fontSize = UIFont.systemFont(ofSize: 22)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: applyText))
        label.attributedText = attributedString
    }
}

