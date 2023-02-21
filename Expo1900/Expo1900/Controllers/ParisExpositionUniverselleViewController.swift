//
//  Expo1900 - ParisExpositionUniverselleViewController.swift
//  Created by kaki, brody.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ParisExpositionUniverselleViewController: UIViewController {
    
    @IBOutlet private weak var expositionTitle: UILabel!
    @IBOutlet private weak var expositionPoster: UIImageView!
    @IBOutlet private weak var expositionVisitors: UILabel!
    @IBOutlet private weak var expositionLocation: UILabel!
    @IBOutlet private weak var expositionDuration: UILabel!
    @IBOutlet private weak var expositionDescription: UILabel!
    @IBOutlet private weak var flagImage1: UIImageView!
    @IBOutlet private weak var flagImage2: UIImageView!
    
    private var expositionData: ExpositionUniverselle?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadExpositionData()
        setupUI()
    }
    
    private func loadExpositionData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expositionData = try jsonDecoder.decode(ExpositionUniverselle.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupUI() {
        guard let expositionData = expositionData else { return }
        
        expositionTitle.text = expositionData.title
        expositionPoster.image = UIImage(named: "poster")
        expositionVisitors.text = "\(expositionData.visitors)"
        expositionLocation.text = expositionData.location
        expositionDuration.text = expositionData.duration
        expositionDescription.text = expositionData.description
        flagImage1.image = UIImage(named: "flag")
        flagImage2.image = UIImage(named: "flag")
    }
}

