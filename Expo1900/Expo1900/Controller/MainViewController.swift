//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var exposition: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData(assetName: ExpositionContents.dataAssetName)
        expositionInformation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeData(assetName: String) {
        let expositionDecoder = JSONDecoder()
        guard let assetData = NSDataAsset(name: assetName) else { return }
        
        do {
            exposition = try expositionDecoder.decode(Exposition.self, from: assetData.data)
        } catch {
            print(ErrorData.dataDecodingError.errorMassege)
        }
    }
    
    private func expositionInformation() {
        guard let exposition = exposition else { return }
        let visitorNumber = numberThousandUnitComma(to: exposition.visitors)
        let titleText = titleTextLineBreak(to: exposition.title)
        titleLabel.text = titleText
        visitorsLabel.text = ExpositionContents.visitorsText + visitorNumber + ExpositionContents.personsText
        locationLabel.text = ExpositionContents.locationText + exposition.location
        durationLabel.text = ExpositionContents.durationText + exposition.duration
        descriptionLabel.text = exposition.description
    }
    
    private func numberThousandUnitComma(to number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let text = numberFormatter.string(from: NSNumber(value: number)) else {
            return String(number)
        }
        return text
    }
    
    private func titleTextLineBreak(to title: String) -> String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
}

extension MainViewController {
    struct ExpositionContents {
        static let dataAssetName = "exposition_universelle_1900"
        static let visitorsText = "방문객 : "
        static let personsText = " 명"
        static let locationText = "개최지 : "
        static let durationText = "개최 기간 : "
    }
}

