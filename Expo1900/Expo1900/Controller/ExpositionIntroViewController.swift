//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionIntroViewController: UIViewController {
    @IBOutlet weak private var expositionTitleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.configureExposionLabel()
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "메인"
    }
    
    private func configureExposionLabel() {
        guard let exposition: Exposition = DecodingHandler.decode(fileName: .exposition) else { return }
        
        self.expositionTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        let expoTitle = NSMutableAttributedString(string: "방문객 : " + format(by: exposition.visitors))
        let expoLocation = NSMutableAttributedString(string: "개최지 : " + exposition.location)
        let expoDuration = NSMutableAttributedString(string: "개최 기간 : " + exposition.duration)
        let font1 = UIFont.systemFont(ofSize: 20)

        expoTitle.addAttribute(.font, value: font1, range: NSRange(location: 0, length: 4))
        expoLocation.addAttribute(.font, value: font1, range: NSRange(location: 0, length: 4))
        expoDuration.addAttribute(.font, value: font1, range: NSRange(location: 0, length: 5))

        self.visitorsLabel.attributedText = expoTitle
        self.locationLabel.attributedText = expoLocation
        self.durationLabel.attributedText = expoDuration
        self.descriptionLabel.text = exposition.description
    }
    
    private func format(by target: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: target)) ?? ""
    }
    
    @IBAction private func tabKoreanEntryButton(_ sender: UIButton) {
        guard let koreanEntryListViewController = self.storyboard?.instantiateViewController(withIdentifier: KoreanEntryListViewController.identifier) as? KoreanEntryListViewController else { return }
        
        self.navigationController?.pushViewController(koreanEntryListViewController, animated: true)
    }
}
