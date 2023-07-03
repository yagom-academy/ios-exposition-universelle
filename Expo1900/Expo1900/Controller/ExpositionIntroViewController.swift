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
        self.configureExpositionLabel()
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "메인"
    }
    
    private func configureExpositionLabel() {
        guard let exposition: Exposition = DecodingHandler.decode(fileName: .exposition) else { return }
                
        let visitorClause = "방문객 : "
        let locationClause = "개최지 : "
        let durationClause = "개최 기간 : "
        
        self.expositionTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        let expoVisitor = NSMutableAttributedString(string: visitorClause + exposition.visitors.expositionFormat)
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
    
    @IBAction private func tabKoreanEntryButton(_ sender: UIButton) {
        guard let koreanEntryListViewController = self.storyboard?.instantiateViewController(withIdentifier: KoreanEntryListViewController.identifier) as? KoreanEntryListViewController else { return }
        
        self.navigationController?.pushViewController(koreanEntryListViewController, animated: true)
    }
}
