//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var mainStackView: UIStackView!
    private let jsonDecoder = JSONDecoder()
    private var exposition: Exposition? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exposition = decodeExposition("exposition_universelle_1900")
        configureView()
    }
    
    private func decodeExposition(_ file: String) -> Exposition? {
        guard let expositionAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        let exposition = try? jsonDecoder.decode(Exposition.self, from: expositionAsset.data)
        
        return exposition
    }
    
    func configureView() {
        let koreanTitleLabel: UILabel = {
            let label = UILabel()
            label.text = exposition?.koreanTitle
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            
            return label
        }()
        
        mainStackView.addArrangedSubview(koreanTitleLabel)
        
        let englishTitleLabel: UILabel = {
            let label = UILabel()
            label.text = exposition?.englishTitle
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            
            return label
        }()
        
        mainStackView.addArrangedSubview(englishTitleLabel)
        
        let visitorsLabel: UILabel = {
            let label = UILabel()
            label.text = "방문객 : \(exposition?.visitors ?? 0)"
            label.font = UIFont.preferredFont(forTextStyle: .title2)
            
            return label
        }()
        
        mainStackView.addArrangedSubview(visitorsLabel)
        
        let locationLabel: UILabel = {
            let label = UILabel()
            label.text = exposition?.location
            label.font = UIFont.preferredFont(forTextStyle: .title2)
            
            return label
        }()
        
        mainStackView.addArrangedSubview(locationLabel)
        
        let durationLabel: UILabel = {
            let label = UILabel()
            label.text = exposition?.duration
            label.font = UIFont.preferredFont(forTextStyle: .title2)
            
            return label
        }()
        
        mainStackView.addArrangedSubview(durationLabel)
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = exposition?.description
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.numberOfLines = 0
            
            return label
        }()
        
        mainStackView.addArrangedSubview(descriptionLabel)
    }
}
