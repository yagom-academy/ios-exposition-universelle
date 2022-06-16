//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var expositionImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var leftFlagImageView: UIImageView!
    @IBOutlet private weak var presentItemsButton: UIButton!
    @IBOutlet private weak var rightFlagImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        adjustLabelAttribute()
        setAllImages()
        
        do {
            let decodedData = try decodeExpositionData()
            setAllLabels(of: decodedData)
        } catch let error as DataHandlingError {
            print(error.description)
        } catch {
            print("Undexpected error: \(error)")
        }
    }
    
    private func decodeExpositionData() throws -> Exposition {
        guard let mainPage = NSDataAsset.init(name: "exposition_universelle_1900") else { throw DataHandlingError.invalidFile }
        
        var exposition: Exposition
        let jsonDecoder = JSONDecoder()
        exposition = try jsonDecoder.decode(Exposition.self, from: mainPage.data)
        
        return exposition
    }
    
    private func setAllLabels(of exposition: Exposition) {
        titleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = "방문객 :  \(applyNumberFormat(to: exposition.visitors)) 명"
        locationLabel.text = "개최지 : \(exposition.location)"
        durationLabel.text = "개최 기간 : \(exposition.duration)"
        descriptionLabel.text = exposition.description
    }
    
    private func applyNumberFormat(to number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number) ?? ""
    }
    
    private func setAllImages() {
        expositionImageView.image = #imageLiteral(resourceName: "poster")
        
        leftFlagImageView.image = #imageLiteral(resourceName: "flag")
        rightFlagImageView.image = #imageLiteral(resourceName: "flag")
    }
    
    private func adjustLabelAttribute() {
        descriptionLabel.numberOfLines = 0
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    }
}

