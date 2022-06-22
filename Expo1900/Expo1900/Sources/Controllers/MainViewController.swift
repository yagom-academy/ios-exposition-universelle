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
    @IBOutlet private weak var presentKoreanContentsButton: UIButton!
    @IBOutlet private weak var rightFlagImageView: UIImageView!

    private let appDelegate = UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
        
        fetchExpositionData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        appDelegate.isVerticalOrientationBlocked = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appDelegate.isVerticalOrientationBlocked = false
    }
    
    private func fetchExpositionData() {
        do {
            let decodedData = try decodeExpositionData()
            setupLabels(of: decodedData)
        } catch let error as DataHandlingError {
            print(error.description)
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    private func decodeExpositionData() throws -> Exposition {
        guard let mainPage = NSDataAsset.init(name: "exposition_universelle_1900") else { throw DataHandlingError.invalidFile }
        
        var exposition: Exposition
        let jsonDecoder = JSONDecoder()
        exposition = try jsonDecoder.decode(Exposition.self, from: mainPage.data)
        
        return exposition
    }
    
    private func setupLabels(of exposition: Exposition) {
        descriptionLabel.numberOfLines = 0
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        
        visitorsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        visitorsLabel.adjustsFontForContentSizeCategory = true
        visitorsLabel.text = "방문객 :  \(applyNumberFormat(to: exposition.visitors)) 명"
        
        locationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        locationLabel.adjustsFontForContentSizeCategory = true
        locationLabel.text = "개최지 : \(exposition.location)"
        
        durationLabel.font = UIFont.preferredFont(forTextStyle: .body)
        durationLabel.adjustsFontForContentSizeCategory = true
        durationLabel.text = "개최 기간 : \(exposition.duration)"
        
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.text = exposition.description
    }
    
    private func applyNumberFormat(to number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number) ?? ""
    }
    
    private func setupImages() {
        expositionImageView.image = #imageLiteral(resourceName: "poster")
        leftFlagImageView.image = #imageLiteral(resourceName: "flag")
        rightFlagImageView.image = #imageLiteral(resourceName: "flag")
    }
}

