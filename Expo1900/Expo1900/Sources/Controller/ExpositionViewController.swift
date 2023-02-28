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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    
    private func configureTitle() {
        navigationItem.title = NameSpace.homeViewTitle
    }
    
    private func configureLabel() {
        let expositionUniverselle = decodingJson().decodeExpositionJson()
        
        titleLabel.text = expositionUniverselle.title
        visitorCountLabel.text = NameSpace.leftVisitorCountString
        + String(expositionUniverselle.visitorCount) + NameSpace.rightVisitorCountString
        locationLabel.text = NameSpace.leftLocationString + expositionUniverselle.location
        durationLabel.text = NameSpace.leftDurationString + expositionUniverselle.duration
        descriptionLabel.text = expositionUniverselle.description
    }
    
    private func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func touchUpInsideItemButton(_ sender: UIButton) {
        guard let itemsView: ItemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "itemViewController") as? ItemListViewController else { return }
        
        navigationController?.pushViewController(itemsView, animated: true)
    }
}
