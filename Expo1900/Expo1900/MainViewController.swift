//
//  Expo1900 - ViewController.swift
//  Created by 사파리 파프리. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var decriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setUpView() {
        guard let expoInfomation = Expo.parsingJson(name: "exposition_universelle_1900") else { return }
        
        titleLabel.text = expoInfomation.title
        posterImageView.image = UIImage(named: "poster")
        visitorsLabel.text = .visitor + " : \(expoInfomation.visitors)"
        locationLabel.text = .location + " : \(expoInfomation.location)"
        durationLabel.text = .duration + " : \(expoInfomation.duration)"
        changeFont()
        decriptionLabel.text = expoInfomation.description
    }
    
    private func changeFont() {
        visitorsLabel.changePartFont(part: .visitor)
        locationLabel.changePartFont(part: .location)
        durationLabel.changePartFont(part: .duration)
    }
}


private extension UILabel {
    func changePartFont(part: String) {
        guard let text = self.text else { return }
        let mutableText = NSMutableAttributedString(string: text)
        let changingRange = (text as NSString).range(of: part)
        
        mutableText.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .title3), range: changingRange)
        
        self.attributedText = mutableText
    }
}

private extension String {
    static var visitor: String { "방문객" }
    static var location: String { "개최지" }
    static var duration: String { "개최기간" }
}
