//
//  ExpoViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet private weak var expoTitleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descrtiptionLabel: UILabel!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    private let orientaionMask = OrientaionMake.shared
    private let modelManager = ModelManager.shared

    override func viewDidLoad() {
        if modelManager.expoData == nil {
            switch try? initExpoData() {
            case .success(let data):
                modelManager.expoData = data
                initUI()
                setLabelAttribute()
            case .failure(let error):
                alterError(error)
            case .none:
                alterError(ExpoError.unknown)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        orientaionMask.judgedOrientaionMake(false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        orientaionMask.judgedOrientaionMake(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func touchUpMoveToKoreaItems(_ sender: Any) {
        let koreaEntryViewController = KoreaEntryViewController()
        self.navigationController?.pushViewController(koreaEntryViewController, animated: true)
    }
    
    private func initExpoData() throws -> Result<Expo, ExpoError> {
        guard let dataAsset = NSDataAsset(name: Constant.expoJson) else {
            return .failure(ExpoError.expoData)
        }
        return .success(try JSONDecoder().decode(Expo.self, from: dataAsset.data))
    }
    
    private func initUI() {
        guard let expo = modelManager.expoData else { return }
        self.navigationItem.title = Constant.pageTitle
        expoTitleLabel.text = expo.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = PrefixWord.visitors + creatVisitorsComma(expo.visitors) + SuffixWord.visitors
        locationLabel.text = PrefixWord.location + expo.location
        durationLabel.text = PrefixWord.duration + expo.duration
        descrtiptionLabel.text = expo.description
    }
    
    private func creatVisitorsComma(_ visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let decimalStyleValue = numberFormatter.string(from: NSNumber(value: Int(visitors))) else {
            return String(visitors)
        }
        return decimalStyleValue
    }

    private func setLabelAttribute() {
        expoTitleLabel.numberOfLines = 2
        expoTitleLabel.textAlignment = .center
        expoTitleLabel.adjustsFontSizeToFitWidth = true
        
        visitorsLabel.numberOfLines = 0
        visitorsLabel.textAlignment = .center
        visitorsLabel.adjustsFontSizeToFitWidth = true
        
        locationLabel.numberOfLines = 0
        locationLabel.textAlignment = .center
        locationLabel.adjustsFontSizeToFitWidth = true
        
        durationLabel.numberOfLines = 0
        durationLabel.textAlignment = .center
        durationLabel.adjustsFontSizeToFitWidth = true
        
        descrtiptionLabel.numberOfLines = 0
        descrtiptionLabel.lineBreakStrategy = .hangulWordPriority
        descrtiptionLabel.textAlignment = .justified
        
        backgroundImageView.alpha = 0.15
        self.view.sendSubviewToBack(backgroundImageView)
    }
}

extension ExpoViewController {
    enum Constant {
        static let expoJson = "exposition_universelle_1900"
        static let pageTitle = "메인"
    }
    
    enum PrefixWord {
        static let visitors = "방문객 : "
        static let location = "개최지 : "
        static let duration = "개최 기간 : "
    }
    
    enum SuffixWord {
        static let visitors = " 명"
    }
}
