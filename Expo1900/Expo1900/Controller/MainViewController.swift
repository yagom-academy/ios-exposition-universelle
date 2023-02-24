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
    
    private var exposition: Exposition = Exposition(title: "",
                                                    visitors: 0,
                                                    location: "",
                                                    duration: "",
                                                    description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setUpView() {
        titleLabel.text = exposition.titleLabelText
        visitorsLabel.text = exposition.visitorLabelText
        locationLabel.text = exposition.locationLabelText
        durationLabel.text = exposition.durationLabelText
        descriptionLabel.text = exposition.description
        descriptionLabel.numberOfLines = 0
        posterImageView.image = UIImage(named: "poster")
        flagImage.forEach { $0.image = UIImage(named: "flag") }
    }
}
