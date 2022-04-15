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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - IBAction method
extension MainViewController {
    @IBAction func showListButtonIsTapped(_ sender: UIButton) {
        guard let heritageListVC = storyboard?.instantiateViewController(withIdentifier: IdentifierName.heritageListViewController) as? HeritageListViewController else {
            return
        }
        self.navigationController?.pushViewController(heritageListVC, animated: true)
    }
}

// MARK: - logic method
extension MainViewController {
    private func loadInformation() -> ExpositionInfo? {
        let jsonManager: JsonManagerable = JsonManager()
        
        do {
            let expositionInfo = try jsonManager.decodedExpositionInfo()
            return expositionInfo
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    private func setContentsOfScrollView(_ expositionInfo: ExpositionInfo) {
        titleLabel.text = editTitle(from: expositionInfo.title)
        visitorLabel.text = "방문객 : \(expositionInfo.visitors) 명"
        locationLabel.text = "개최지 : \(expositionInfo.location)"
        durationLabel.text = "개최 기간 : \(expositionInfo.duration)"
        descriptionLabel.text = expositionInfo.description
    }
    
    private func editTitle(from title: String) -> String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
}

