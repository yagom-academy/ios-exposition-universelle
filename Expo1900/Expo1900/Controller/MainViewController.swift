//
//  Expo1900 - MainViewController.swift
//  Created by 세홍, 송준, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var scrollview: UIScrollView!
    @IBOutlet weak private var pushSecondViewButton: UIButton!
    @IBOutlet private var flagImage: [UIImageView]!
    @IBOutlet weak private var posterImageView: UIImageView!
    
    var decodedExposition: ExpositionDecoder = ExpositionDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodedExposition.decodeData()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setUpView() {
        titleLabel.text = decodedExposition.exposition.titleLabelText
        visitorsLabel.text = decodedExposition.exposition.visitorLabelText
        locationLabel.text = decodedExposition.exposition.locationLabelText
        durationLabel.text = decodedExposition.exposition.durationLabelText
        descriptionLabel.text = decodedExposition.exposition.description
        descriptionLabel.numberOfLines = 0
        posterImageView.image = UIImage(named: "poster")
        flagImage.forEach { $0.image = UIImage(named: "flag") }
    }
}
