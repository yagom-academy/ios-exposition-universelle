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
    @IBOutlet private weak var backgroundImage: UIImageView!
    
    private var expoData: Expo?
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        
        switch try? initExpoData() {
        case .success(let data):
            expoData = data
            initUI()
            setLableAttribute()
        case .failure(let error):
            alterError(error)
        case .none:
            alterError(ExpoError.unknown)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        appDelegate?.shouldSupportAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = true
    }
    
    @IBAction func touchUpMoveToKoreaitems(_ sender: Any) {
        let koreaEntryViewController = KoreaEntryViewController()
        self.navigationController?.pushViewController(koreaEntryViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func initExpoData() throws -> Result<Expo, ExpoError> {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return .failure(ExpoError.expoData)
        }
        return .success(try JSONDecoder().decode(Expo.self, from: dataAsset.data))
    }
    
    private func initUI() {
        guard let expo = expoData else { return }
        self.navigationController?.title = "메인"
        expoTitleLabel.text = expo.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = "방문객 : " + creatVisitorsComma(expo.visitors)
        locationLabel.text = "개최지 : " + expo.location
        durationLabel.text = "개최 기간 : " + expo.duration
        descrtiptionLabel.text = expo.description
    }
    
    private func creatVisitorsComma(_ visitors: UInt) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let decimalStyleValue = numberFormatter.string(from: NSNumber(value: Int(visitors))) else {
            return ""
        }
        return decimalStyleValue + " 명"
    }

    private func setLableAttribute() {
        expoTitleLabel.numberOfLines = 2
        expoTitleLabel.textAlignment = .center
        expoTitleLabel.adjustsFontSizeToFitWidth = true
        
        visitorsLabel.textAlignment = .center
        visitorsLabel.adjustsFontSizeToFitWidth = true
        
        locationLabel.textAlignment = .center
        locationLabel.adjustsFontSizeToFitWidth = true
        
        durationLabel.textAlignment = .center
        durationLabel.adjustsFontSizeToFitWidth = true
        
        descrtiptionLabel.numberOfLines = 0
        descrtiptionLabel.lineBreakStrategy = .hangulWordPriority
        descrtiptionLabel.textAlignment = .justified
        
        backgroundImage.alpha = 0.15
        self.view.sendSubviewToBack(backgroundImage)
    }
}
