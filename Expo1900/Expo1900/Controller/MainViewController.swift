//
//  Expo1900 - MainViewController.swift
//  Created by Doogie, Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayExpoInfo()
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
    private func getExpoInfo() -> Exposition? {
        do {
            let expoInfo = try Exposition.decode(with: "exposition_universelle_1900")
            return expoInfo
        } catch {
            showAlert(for: "오류", message: "데이터를 불러올 수 없습니다.")
        }
        return nil
    }
    
    private func displayExpoInfo() {
        guard let expoInfo = getExpoInfo() else { return }
        
        titleLabel.text = divide(title: expoInfo.title)
        posterImageView.image = UIImage(named: "poster.png")
        visitorsLabel.text = " : \(expoInfo.visitors.changeVisitorsFormat() ?? "정보 없음")"
        locationLabel.text = " : \(expoInfo.location)"
        durationLabel.text = " : \(expoInfo.duration)"
        descriptionLabel.text = expoInfo.description
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
