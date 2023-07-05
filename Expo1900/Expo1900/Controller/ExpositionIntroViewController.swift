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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        appDelegate.shouldSupportAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        appDelegate.shouldSupportAllOrientation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.configureExpositionLabel()
        self.configureLableFont()
        self.configureDynamicType()
        self.configureAccessibility()
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "메인"
    }
    
    private func configureExpositionLabel() {
        guard let exposition: Exposition = DecodingHelper.decode(file: .exposition) else {
            self.showErrorAlert()
            return
        }
                
        let visitorClause = "방문객 : "
        let locationClause = "개최지 : "
        let durationClause = "개최 기간 : "
        
        self.expositionTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        let expoVisitor = NSMutableAttributedString(string: visitorClause + exposition.visitors.expositionFormat + " 명")
        let expoLocation = NSMutableAttributedString(string: locationClause + exposition.location)
        let expoDuration = NSMutableAttributedString(string: durationClause + exposition.duration)
        let clauseFont = UIFont.systemFont(ofSize: 20)

        expoVisitor.addAttribute(.font, value: clauseFont, range: NSRange(location: 0, length: visitorClause.count))
        expoLocation.addAttribute(.font, value: clauseFont, range: NSRange(location: 0, length: locationClause.count))
        expoDuration.addAttribute(.font, value: clauseFont, range: NSRange(location: 0, length: durationClause.count))

        self.visitorsLabel.attributedText = expoVisitor
        self.locationLabel.attributedText = expoLocation
        self.durationLabel.attributedText = expoDuration
        self.descriptionLabel.text = exposition.description
    }
    
    private func configureLableFont() {
        self.expositionTitleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        self.visitorsLabel.font = .preferredFont(forTextStyle: .body)
        self.locationLabel.font = .preferredFont(forTextStyle: .body)
        self.durationLabel.font = .preferredFont(forTextStyle: .body)
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
