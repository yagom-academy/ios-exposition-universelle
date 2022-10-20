//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    private var expositionUniverselle: ExpositionUniverselle?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backButtonTitle = "메인"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpoInformation()
        setTextToDisplay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchExpoInformation() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            self.expositionUniverselle = try jsonDecoder.decode(ExpositionUniverselle.self,
                                                                from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setTextToDisplay() {
        guard let expositionUniverselle = expositionUniverselle else {
            return
        }
        let formattedVisitor: String = changeNumberFormat(
            number:"\(expositionUniverselle.visitors)"
        )

        let vistors: String = "방문객 : \(formattedVisitor) 명"
        let location: String = "개최지 : " + expositionUniverselle.location
        let duration: String = "개최 기간 : " + expositionUniverselle.duration
        
        titleLabel.text = """
                        \(String(expositionUniverselle.title.split(separator: "(").first ?? ""))
                        (\(String(expositionUniverselle.title.split(separator: "(").last ?? ""))
                        """

        titleLabel.font = UIFont.systemFont(ofSize: 30)
        visitorsLabel.attributedText = vistors.createAttributed(target: "방문객")
        locationLabel.attributedText = location.createAttributed(target: "개최지")
        durationLabel.attributedText = duration.createAttributed(target: "개최 기간")
        descriptionTextView.text = expositionUniverselle.description
    }
    
    private func changeNumberFormat(number: String) -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let decimalNumber = Double(number) else {
            return number
        }
        return formatter.string(from: NSNumber(value: decimalNumber))!
    }
}

