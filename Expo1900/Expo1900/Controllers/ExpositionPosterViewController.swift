//
//  Expo1900 - ExpositionPosterViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionPosterViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var rightFlagImageView: UIImageView!
}

extension ExpositionPosterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePosterView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        lockRotation()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        releaseRotation()
    }
    
    private func lockRotation() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        delegate.restrictOrientation = .portrait
    }
    
    private func releaseRotation() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        delegate.restrictOrientation = .all
    }
    
    private func configurePosterView() {
        guard let asset = NSDataAsset.init(name: AssetFileName.expositionUniverselle),
              let poster = try? JSONDecoder().decode(ExpositionPoster.self, from: asset.data) else {
            return
        }
        
        titleLabel.text = poster.title
        visitorsLabel.text = poster.visitorContents
        locationLabel.text = poster.locationContents
        durationLabel.text = poster.durationContents
        descriptionLabel.text = poster.description
        
        posterImageView.image = UIImage(named: AssetFileName.poster)
        leftFlagImageView.image = UIImage(named: AssetFileName.flag)
        rightFlagImageView.image = UIImage(named: AssetFileName.flag)
    }
}

extension ExpositionPosterViewController {
    @IBAction private func didTapKoreanEntryButton(_ sender: UIButton) {
        guard let KoreanEntryTableViewContoller = self.storyboard?.instantiateViewController(withIdentifier: KoreanEntryTableViewController.identifier) as? KoreanEntryTableViewController else {
            return
        }
        self.navigationController?.pushViewController(KoreanEntryTableViewContoller, animated: true)
    }
}
