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
        
        expositionTitle.text = expositionData.displayedTitle
        expositionPoster.image = UIImage(named: "poster")
        expositionVisitors.attributedText = changeFont(expositionData.displayedVisitors)
        expositionLocation.attributedText = changeFont(expositionData.displayedLocation)
        expositionDuration.attributedText = changeFont(expositionData.displayedDuration)
        expositionDescription.text = expositionData.description
        flagImage1.image = UIImage(named: "flag")
        flagImage2.image = UIImage(named: "flag")
    }
    
    private func changeFont(_ text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        guard let index = text.firstIndex(of: ":") else { return attributedString }
        
        let range = String(text[index...])
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: (text as NSString).range(of: range))
        
        return attributedString
    
    }
}

