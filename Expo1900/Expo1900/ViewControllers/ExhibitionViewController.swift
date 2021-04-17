//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExhibitionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var holdingPeriodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        changeViewsValue()
        self.navigationItem.backButtonTitle = KoreanLetter.main
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func changeViewsValue() {
        changeFont(from: visitorsLabel, applyText: KoreanLetter.visitor)
        changeFont(from: venueLabel, applyText: KoreanLetter.venue)
        changeFont(from: holdingPeriodLabel, applyText: KoreanLetter.holdingPeriod)
    }
    
    private func initViews() {
        let jsonDecoder = JSONDecoder()
        guard let exhibitionJsonData = NSDataAsset(name: "exposition_universelle_1900") else { return }
        guard let exhibitionInfomation = try? jsonDecoder.decode(ExhibitionInfomation.self, from: exhibitionJsonData.data) else { return }
        
        titleLabel.text = exhibitionInfomation.newlineTitle
        titleLabel.textAlignment = .center
        visitorsLabel.text = KoreanLetter.visitor + SpecialSymbol.colonWithBlack + exhibitionInfomation.formattedVistorsNumber + KoreanLetter.person
        venueLabel.text = KoreanLetter.venue + SpecialSymbol.colonWithBlack + exhibitionInfomation.location
        holdingPeriodLabel.text = KoreanLetter.holdingPeriod + SpecialSymbol.colonWithBlack + exhibitionInfomation.duration
        descriptionLabel.text = exhibitionInfomation.description
    }
    
    private func changeFont(from label: UILabel, applyText: String) {
        guard let text = label.text else { return }
        let fontSize = UIFont.systemFont(ofSize: 22)
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: fontSize, range: (text as NSString).range(of: applyText))
        label.attributedText = attributedString
    }
}

