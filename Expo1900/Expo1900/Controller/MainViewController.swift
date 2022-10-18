//  Expo1900 - MainViewController.swift
//  Created by Mangdi, zhilly on 2022/10/17

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
    }
    
    func configureLabels() {
        guard let expositionUniverselle = loadExpositionUniverselle() else { return }

        titleLabel.text = expositionUniverselle.title.split(separator: "(").joined(separator: "\n(")
        visitorsCountLabel.text = " : \(changeNumberFormat(input: expositionUniverselle.visitors)) 명"
        locationLabel.text = " : \(expositionUniverselle.location)"
        durationLabel.text = " : \(expositionUniverselle.duration)"
        descriptionTextView.text = expositionUniverselle.description
    }
    
    func loadExpositionUniverselle() -> ExpositionUniverselle? {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
        
        do {
            let result = try jsonDecoder.decode(ExpositionUniverselle.self, from: dataAsset.data)
            return result
        } catch {
            return nil
        }
    }
    
    func changeNumberFormat(input: Int) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: input) ?? ""
    }
}
