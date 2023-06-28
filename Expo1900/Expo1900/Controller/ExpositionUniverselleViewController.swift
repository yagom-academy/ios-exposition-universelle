//
//  Expo1900 - ExpositionUniverselleViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpositionUniverselleViewController: UIViewController {
    private var expositionUniverselle: ExpositionUniverselle?
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeJSONToExpositionUniverselle()
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func tapShowItemsButton(_ sender: UIButton) {
        guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: ItemsTableViewController.id) as? ItemsTableViewController else {
            return
        }
        
        nextViewController.navigationTitle = sender.currentTitle?.replacingOccurrences(of: " 보러가기", with: "")
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func configureLabels() {
        guard let expositionUniverselle else {
            return
        }
        
        titleLabel.text = expositionUniverselle.title
        visitorsLabel.text = "방문객 : \(formatNumber(of: expositionUniverselle.visitors)) 명"
        locationLabel.text = "개최지 : \(expositionUniverselle.location)"
        durationLabel.text = "개최 기간 : \(expositionUniverselle.duration)"
        descriptionLabel.text = expositionUniverselle.description
        
    }
    
    private func decodeJSONToExpositionUniverselle() {
        do {
            expositionUniverselle = try ExpositionUniverselle.decodeExpositionUniverselle()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func formatNumber(of number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number) ?? "0"
    }
}
