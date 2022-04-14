//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let expositionInfo = loadInformation() else {
            return
        }
        setContentsOfScrollView(expositionInfo)
    }
    
    func loadInformation() -> ExpositionInfo? {
        let jsonManager: JsonManagerable = JsonManager()
        
        do {
            let expositionInfo = try jsonManager.decodedExpositionInfo()
            return expositionInfo
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    // 네이밍 추후 변경
    func setContentsOfScrollView(_ expositionInfo: ExpositionInfo) {
        titleLabel.text = editTitle(from: expositionInfo.title)
        visitorLabel.text = "방문객 : \(expositionInfo.visitors) 명"
        locationLabel.text = "개최지 : \(expositionInfo.location)"
        durationLabel.text = "개최 기간 : \(expositionInfo.duration)"
        descriptionLabel.text = expositionInfo.description
    }
    
    func editTitle(from title: String) -> String {
        // (를 찾아서 앞에 "\n"를 추가한다
        return title.replacingOccurrences(of: "(", with: "\n(")
    }

}

