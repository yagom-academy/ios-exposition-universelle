//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var visitorsLabel: UILabel!
    @IBOutlet var visitorsNumberLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationStringLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var durationStringLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var leftFlagImageView: UIImageView!
    @IBOutlet var showKoreanEntryButton: UIButton!
    @IBOutlet var rightFlagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateComponents()
        
        self.navigationItem.backButtonTitle = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func moveToKoreanEntry(_ sender: UIButton) {
        guard let entriesTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntriesTableViewController") as? EntriesTableViewController else {
            return
        }
        
        self.navigationController?.pushViewController(entriesTableViewController, animated: true)
    }
    
    func updateComponents() {
        guard let exposition = JSONDecoder().decode(from: "exposition_universelle_1900", to: ExpositionDTO.self)?.toExposition() else {
            return
        }
        
        self.titleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        self.titleLabel.font = .preferredFont(forTextStyle: .title1)
        self.titleLabel.textAlignment = .center
        
        self.posterImageView.image = UIImage(named: "poster")
        
        self.visitorsLabel.text = "방문객 : "
        self.visitorsLabel.font = .preferredFont(forTextStyle: .title3)
        
        self.visitorsNumberLabel.text = String(exposition.visitors)
        
        self.locationLabel.text = "개최지 : "
        self.locationLabel.font = .preferredFont(forTextStyle: .title3)
        
        self.locationStringLabel.text = exposition.location
        
        self.durationLabel.text = "개최 기간 : "
        self.durationLabel.font = .preferredFont(forTextStyle: .title3)
        
        self.durationStringLabel.text = exposition.duration
        
        self.descriptionLabel.text = exposition.description
        
        self.leftFlagImageView.image = UIImage(named: "flag")
        
        self.showKoreanEntryButton.setTitle("한국의 출품작", for: .normal)
        
        self.rightFlagImageView.image = UIImage(named: "flag")
    }
}
