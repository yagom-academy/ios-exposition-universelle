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
    @IBOutlet weak private var koreanEntryButton: UIButton!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if let appDelegate {
            appDelegate.shouldSupportAllOrientation = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        if let appDelegate {
            appDelegate.shouldSupportAllOrientation = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.configureLabel()
        self.configureDynamicType()
        self.configureAccessibility()
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "메인"
    }
    
    private func configureLabel() {
        guard let exposition: Exposition = DecodingHelper.decode(file: .exposition) else {
            self.showErrorAlert()
            return
        }
                
        let visitorTitle = "방문객 : "
        let locationTitle = "개최지 : "
        let durationTitle = "개최 기간 : "
        
        let totalVisitorText = NSMutableAttributedString(string: visitorTitle + exposition.visitors.expositionFormat)
        let totalLocationText = NSMutableAttributedString(string: locationTitle + exposition.location)
        let totalDurationText = NSMutableAttributedString(string: durationTitle + exposition.duration)
        
        let titleFont = UIFont.preferredFont(forTextStyle: .title2)
        let contentFont = UIFont.preferredFont(forTextStyle: .callout)
        
        totalVisitorText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: visitorTitle.count))
        totalLocationText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: locationTitle.count))
        totalDurationText.addAttribute(.font, value: titleFont, range: NSRange(location: 0, length: durationTitle.count))
        
        totalVisitorText.addAttribute(.font, value: contentFont, range: NSRange(location: visitorTitle.count, length: exposition.visitors.expositionFormat.count))
        totalLocationText.addAttribute(.font, value: contentFont, range: NSRange(location: locationTitle.count, length: exposition.location.count))
        totalDurationText.addAttribute(.font, value: contentFont, range: NSRange(location: durationTitle.count, length: exposition.duration.count))
        
        self.expositionTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        self.visitorsLabel.attributedText = totalVisitorText
        self.locationLabel.attributedText = totalLocationText
        self.durationLabel.attributedText = totalDurationText
        self.descriptionLabel.text = exposition.description
        
        self.expositionTitleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        self.descriptionLabel.font = .preferredFont(forTextStyle: .body)
    }
    
    private func configureDynamicType() {
        self.expositionTitleLabel.adjustsFontForContentSizeCategory = true
        self.visitorsLabel.adjustsFontForContentSizeCategory = true
        self.locationLabel.adjustsFontForContentSizeCategory = true
        self.durationLabel.adjustsFontForContentSizeCategory = true
        self.descriptionLabel.adjustsFontForContentSizeCategory = true
        self.koreanEntryButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    private func configureAccessibility() {
        self.expositionTitleLabel.accessibilityLabel = "파리 만국 박람회 1900"
        self.durationLabel.accessibilityLabel = "개최기간: 1900. 04. 14부터 1900. 11. 12까지"
    }
    
    @IBAction private func tabKoreanEntryButton(_ sender: UIButton) {
        guard let koreanEntryListViewController = self.storyboard?.instantiateViewController(withIdentifier: KoreanEntryListViewController.identifier) as? KoreanEntryListViewController else { return }
        
        self.navigationController?.pushViewController(koreanEntryListViewController, animated: true)
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "에러", message: "데이터를 불러올 수 없습니다.", preferredStyle: .alert)
        let confirmButton = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmButton)
        present(alert, animated: true, completion: nil)
    }
}
