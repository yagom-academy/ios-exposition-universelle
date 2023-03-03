//
//  Expo1900 - ExpositionViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorCountLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appDelegate?.shouldSupportAllOrientation = false
        configureNavigationBar(isHidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appDelegate?.shouldSupportAllOrientation = true
        configureNavigationBar(isHidden: false)
    }
    
    private func configureTitle() {
        navigationItem.title = NameSpace.homeViewTitle
    }
    
    private func configureLabel() {
        let expositionUniverselle = Decoder().decodeExpositionJson()
        
        titleLabel.text = expositionUniverselle.title
        visitorCountLabel.text = String(format: NameSpace.visitorCountText, expositionUniverselle.visitorCount.insertComma())
        locationLabel.text = String(format: NameSpace.locationText, expositionUniverselle.location)
        durationLabel.text = String(format: NameSpace.durationText, expositionUniverselle.duration)
        descriptionLabel.text = expositionUniverselle.description
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        visitorCountLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        locationLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        durationLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        titleLabel.adjustsFontForContentSizeCategory = true
        visitorCountLabel.adjustsFontForContentSizeCategory = true
        locationLabel.adjustsFontForContentSizeCategory = true
        durationLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.adjustsFontForContentSizeCategory = true
    }
    
    private func configureNavigationBar(isHidden: Bool) {
        navigationController?.isNavigationBarHidden = isHidden
    }
    
    @IBAction private func touchUpInsideItemButton(_ sender: UIButton) {
        guard let itemListViewController: ItemListViewController = self.storyboard?.instantiateViewController(withIdentifier: ItemListViewController.identifier) as? ItemListViewController else { return }
        
        navigationController?.pushViewController(itemListViewController, animated: true)
    }
}
