//  Expo1900 - MainViewController.swift
//  Created by Mangdi, zhilly on 2022/10/17

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsCountLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        changeSupportAllOrientation(to: false)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.topItem?.backButtonTitle = "메인"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        changeSupportAllOrientation(to: true)
    }
    
    private func changeSupportAllOrientation(to option: Bool) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.isSupportAllOrientation = option
        }
    }
    
    private func configureLabels() {
        guard let expositionUniverselle = loadExpositionUniverselle() else { return }

        titleLabel.text = expositionUniverselle.title.split(separator: "(").joined(separator: "\n(")
        visitorsCountLabel.text = " : \(changeNumberToDecimalString(input: expositionUniverselle.visitors)) 명"
        locationLabel.text = " : \(expositionUniverselle.location)"
        durationLabel.text = " : \(expositionUniverselle.duration)"
        descriptionTextView.text = expositionUniverselle.description
    }
    
    private func loadExpositionUniverselle() -> ExpositionUniverselle? {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return nil }
        
        do {
            let result = try jsonDecoder.decode(ExpositionUniverselle.self, from: dataAsset.data)
            return result
        } catch {
            notifyErrorAlert()
            return nil
        }
    }
    
    private func notifyErrorAlert() {
        let alert: UIAlertController = UIAlertController(
            title: "파일 없음",
            message: "파일을 읽어올 수 없습니다.",
            preferredStyle: .alert
        )
        let okButton: UIAlertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    private func changeNumberToDecimalString(input: Int) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: input) ?? ""
    }
}
