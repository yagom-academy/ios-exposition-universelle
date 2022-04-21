//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController, GenerateErrorAlertProtocol {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextOfMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        appDelegate?.shouldSupportAllOrientation = false
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appDelegate?.shouldSupportAllOrientation = true
    }
}

// MARK: - IBAction method
extension MainViewController {
    @IBAction func showListButtonIsTapped(_ sender: UIButton) {
        guard let heritageListViewController = storyboard?.instantiateViewController(withIdentifier: HeritageListViewController.identifier) as? HeritageListViewController else {
            return
        }
        navigationController?.pushViewController(heritageListViewController, animated: true)
    }
}

// MARK: - logic method
extension MainViewController {
    private func loadInformation() -> ExpositionInfo? {
        let jsonManager: JsonManagerable = JsonManager()
        
        do {
            let expositionInfo: ExpositionInfo = try jsonManager.decodedResult()
            return expositionInfo
        } catch {
            let alertController = makeUIAlertControllerFromError(error)
            present(alertController, animated: true, completion: nil)
            return nil
        }
    }

    private func setTextOfMainView() {
        guard let expositionInfo = loadInformation() else {
            return
        }
        titleLabel.text = splitTitleToTwoLines(from: expositionInfo.title)
        visitorLabel.text = "방문객 : \(expositionInfo.visitors) 명"
        locationLabel.text = "개최지 : \(expositionInfo.location)"
        durationLabel.text = "개최 기간 : \(expositionInfo.duration)"
        descriptionLabel.text = expositionInfo.description
    }
    
    private func splitTitleToTwoLines(from title: String) -> String {
        return title.replacingOccurrences(of: "(", with: "\n(")
    }
}
