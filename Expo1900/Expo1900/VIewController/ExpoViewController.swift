//
//  ExpoViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/05.
//

import UIKit

final class ExpoViewController: UIViewController {
    @IBOutlet private weak var expoTitle: UILabel!
    @IBOutlet private weak var visitors: UILabel!
    @IBOutlet private weak var location: UILabel!
    @IBOutlet private weak var duration: UILabel!
    @IBOutlet private weak var desc: UILabel!
    @IBOutlet private weak var backgroundImage: UIImageView!
    
    private var expoData: Expo?

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
        expoTitle.text = expo.title.replacingOccurrences(of: "(", with: "\n(")
        visitors.text = "방문객 : " + creatVisitorsComma(expo.visitors)
        location.text = "개최지 : " + expo.location
        duration.text = "개최 기간 : " + expo.duration
        desc.text = expo.description
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
        expoTitle.numberOfLines = 2
        expoTitle.textAlignment = .center
        expoTitle.adjustsFontSizeToFitWidth = true
        
        desc.numberOfLines = 0
        desc.lineBreakStrategy = .hangulWordPriority
        desc.textAlignment = .justified
        
        backgroundImage.alpha = 0.15
        self.view.sendSubviewToBack(backgroundImage)
    }
}
