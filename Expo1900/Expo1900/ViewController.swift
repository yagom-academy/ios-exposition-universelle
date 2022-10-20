//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var exposition: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureExpositionDataFromJSON(name: "exposition_universelle_1900")
        configureExpositionContents()
    }
    
    private func configureExpositionDataFromJSON(name: String) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else { return }
        
        do {
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
    
    private func configureExpositionContents() {
        titleLabel.text = exposition?.title
        posterImage.image = UIImage(named: "poster")
        visitorsLabel.text = exposition?.visitorsDescription
        locationLabel.text = exposition?.locationDescription
        durationLabel.text = exposition?.durationDescription
        descriptionTextView.text = exposition?.description
    }
    
}

