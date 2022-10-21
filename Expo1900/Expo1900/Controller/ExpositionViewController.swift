//
//  Expo1900 - ExpositionViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureExpositionFromJSON(name: "exposition_universelle_1900")
        configureExpositionViews(exposition)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func configureExpositionFromJSON(name: String) {
        guard let exposition = JSONDecoder().decode(from: name, to: exposition) else { return }
        self.exposition = exposition
    }
    
    private func configureExpositionViews(_ exposition: Exposition?) {
        titleLabel.text = exposition?.title
        posterImage.image = UIImage(named: "poster")
        visitorsLabel.text = exposition?.visitorsDescription
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionTextView.text = exposition?.description
    }
    
}

