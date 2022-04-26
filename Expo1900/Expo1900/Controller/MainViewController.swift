//
//  Expo1900 - MainViewController.swift
//  Created by Doogie, Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var posterImageView: UIImageView!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var listViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayExpoInfo()
        changeButtonLayoutSetting()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    //MARK: -IBAction
    @IBAction private func moveToListViewButton(_ sender: UIButton) {
        guard let listVC = storyboard?.instantiateViewController(withIdentifier: ListViewController.identifier) as? ListViewController else { return }
        
        navigationController?.pushViewController(listVC, animated: true)
    }
    //MARK: -functions
    private func changeButtonLayoutSetting() {
        listViewButton.titleLabel?.adjustsFontForContentSizeCategory = true
        listViewButton.titleLabel?.numberOfLines = 0
        listViewButton.titleLabel?.maximumContentSizeCategory = .accessibilityExtraLarge
        listViewButton.titleLabel?.textAlignment = .center
    }
    
    private func displayExpoInfo() {
        do {
            let expoInfo = try Exposition.getInfo()
            titleLabel.text = divide(title: expoInfo.title)
            posterImageView.image = UIImage(named: "poster.png")
            visitorsLabel.text = "방문객 : \(ExpoNumberFormatter.changeVisitorsFormat(from: expoInfo.visitors) ?? "정보 없음")"
            locationLabel.text = "개최지 : \(expoInfo.location)"
            durationLabel.text = "개최 기간 : \(expoInfo.duration)"
            descriptionLabel.text = expoInfo.description
            
            changeFontSize(for: expoInfo)
        } catch let error {
            showAlert(for: "경고", message: "데이터 로드 오류 \n" + error.localizedDescription)
        }
    }
    
    private func changeFontSize(for expoInfo: Exposition) {
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)
        visitorsLabel.changeFontSize(bodyFont, targetString: ": \(ExpoNumberFormatter.changeVisitorsFormat(from: expoInfo.visitors) ?? "정보 없음")")
        locationLabel.changeFontSize(bodyFont, targetString: ": \(expoInfo.location)")
        durationLabel.changeFontSize(bodyFont, targetString: ": \(expoInfo.duration)")
    }
    
    private func divide(title: String) -> String {
        if title.contains("(") {
            let dividedTitle = title.components(separatedBy: "(")
            return "\(dividedTitle[0])\n(\(dividedTitle[1])"
        } else {
            return title
        }
    }
}
