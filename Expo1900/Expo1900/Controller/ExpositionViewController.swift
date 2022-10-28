//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var expositionManager: ExpositionManager = ExpositionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewsByManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func configureViewsByManager() {
        titleLabel.text = expositionManager.titleLineBreak
        posterImage.image = expositionManager.posterImage
        visitorsLabel.text = expositionManager.formattedVisitorsDescription
        locationLabel.text = expositionManager.exposition?.location
        durationLabel.text = expositionManager.exposition?.duration
        descriptionTextView.text = expositionManager.exposition?.description
    }
}
