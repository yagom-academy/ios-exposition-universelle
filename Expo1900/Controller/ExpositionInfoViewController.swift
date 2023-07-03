//
//  Expo1900 - ExpositionInfoViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionInfoViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var openPeriodLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var tapPushButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showExpositionInfo()
        self.navigationController?.navigationBar.topItem?.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func showExpositionInfo() {
        let decoder = JSONDecoder()
        
        guard let receiveExpositionData = receiveExpositionInfo() else {
            return
        }
        
        do {
            let decodingExposition = try decoder.decodingContentInfo(
                with: receiveExpositionData,
                modelType: Exposition.self
            )
            updateMainViewLabels(with: decodingExposition)
        } catch {
            print(error)
        }
    }
    
    private func receiveExpositionInfo() -> Data? {
        let file = NSDataAsset(name: "exposition_universelle_1900")

        return file?.data
    }
    
    private func updateMainViewLabels(with exposition: Exposition) {
        let formatManager: FormatManager = FormatManager()
        
        guard let visitors = formatManager.numberFormatter
            .string(from: NSNumber(value: exposition.visitors)) else {
            return
        }
        
        titleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitorLabel.text = "방문객 : \(visitors)명"
        locationLabel.text = "개최지 : \(exposition.location)"
        openPeriodLabel.text = "개최 기간 : \(exposition.duration)"
        descriptionLabel.text = exposition.description
    }
    
    @IBAction func touchUpPushButton(_ sender: UIButton) {
        guard let itemListViewController = storyboard?.instantiateViewController(withIdentifier: "ItemListView") else {
            return
        }
        
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
}
