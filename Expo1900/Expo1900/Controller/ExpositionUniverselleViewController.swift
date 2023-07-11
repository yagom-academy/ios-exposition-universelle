//
//  Expo1900 - ExpositionUniverselleViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionUniverselleViewController: UIViewController {
    
    private var expositionUniverselle: ExpositionUniverselle?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeJSONToExpositionUniverselle()
        configureLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func tapShowItemsButton(_ sender: UIButton) {
        guard let nextViewController = storyboard?.instantiateViewController(
            identifier: ItemsTableViewController.id,
            creator: { coder in
                let title = sender.currentTitle?.replacingOccurrences(of: " 보러가기", with: "") ?? ""
                return ItemsTableViewController(navigationTitle: title, coder: coder)
            }
        ) else {
            return
        }
                
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func decodeJSONToExpositionUniverselle() {
        do {
            expositionUniverselle = try AssetDecoder.decode(ExpositionUniverselle.self, from: AssetName.expositionUniverselle)
        } catch {
            print(error.localizedDescription)
            let alert = UIAlertController(title: nil, message: "데이터 로드에 실패했습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "닫기", style: .default))
            present(alert, animated: true)
        }
    }
    
    private func configureLabel() {
        guard let expositionUniverselle else {
            return
        }
        
        titleLabel.text = expositionUniverselle.title
        visitorsLabel.text = "방문객 : \(formatNumber(of: expositionUniverselle.visitors)) 명"
        locationLabel.text = "개최지 : \(expositionUniverselle.location)"
        durationLabel.text = "개최 기간 : \(expositionUniverselle.duration)"
        descriptionLabel.text = expositionUniverselle.description
    }
    
    private func formatNumber(of number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number) ?? "0"
    }
}
