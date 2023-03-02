//
//  Expo1900 - ExpositionViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionViewController: UIViewController {

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
    
    private func configureTitle() {
        navigationItem.title = NameSpace.homeViewTitle
    }
    
    private func configureLabel() {
        let expositionUniverselle = Decoder().decodeExpositionJson()
        
        titleLabel.text = expositionUniverselle.title
        visitorCountLabel.text = String(format: NameSpace.visitorCountText, expositionUniverselle.visitorCount)
        locationLabel.text = String(format: NameSpace.locationText, expositionUniverselle.location)
        durationLabel.text = String(format: NameSpace.durationText, expositionUniverselle.duration)
        descriptionLabel.text = expositionUniverselle.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    
    private func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction private func touchUpInsideItemButton(_ sender: UIButton) {
        guard let itemListViewController: ItemListViewController = self.storyboard?.instantiateViewController(withIdentifier: ItemListViewController.viewIdentifier) as? ItemListViewController else { return }
        
        navigationController?.pushViewController(itemListViewController, animated: true)
    }
}
