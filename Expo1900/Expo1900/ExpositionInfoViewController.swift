//
//  Expo1900 - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionInfoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var openPeriodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tapPushButton: UIButton!
    
    private let formatManager: FormatManager = FormatManager()
    
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
            let decodingExposition = try decoder.decodingContentInfo(with: receiveExpositionData, modelType: Exposition.self)
            updateMainViewLabels(with: decodingExposition)
        } catch {
            print(error)
        }
    }
    
    private func receiveExpositionInfo() -> Data? {
        guard let file = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        
        return file.data
    }
    
    private func updateMainViewLabels(with exposition: Exposition) {
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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ItemListView") else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
