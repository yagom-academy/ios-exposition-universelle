//
//  Expo1900 - MainViewController.swift
//  Created by Doogie, Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayExpoInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func moveToListViewButton(_ sender: UIButton) {
        guard let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return }
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func displayExpoInfo() {
        guard let expoInfo = getExpoInfo() else { return }
        titleLabel.text = divide(title: expoInfo.title)
        posterImageView.image = UIImage(named: "poster.png")
        visitorsLabel.text = " : \(changeNumberFormat(expoInfo.visitors)) 명"
        locationLabel.text = " : \(expoInfo.location)"
        durationLabel.text = " : \(expoInfo.duration)"
        descriptionLabel.text = expoInfo.description
    }
    
    func getExpoInfo() -> Exposition? {
        do {
            let expoInfo = try Exposition.decode(with: "exposition_universelle_1900")
            return expoInfo
        } catch {
            showAlert()
        }
        return nil
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "오류", message: "데이터를 불러올 수 없습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func divide(title: String) -> String {
        let dividedTitle = title.components(separatedBy: "(")
        return "\(dividedTitle[0])\n(\(dividedTitle[1])"
    }
    
    func changeNumberFormat(_ number: Int ) -> String {
        let numberFormmater = NumberFormatter()
        numberFormmater.numberStyle = .decimal
        guard let changedNumber = numberFormmater.string(from: number as NSNumber) else {
            return ""
        }
        return changedNumber
    }
}

