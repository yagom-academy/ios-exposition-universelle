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
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    private var introduction: Introduction?
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeIntroduction()
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func touchUpGoToEntryListButton(_ sender: UIButton) {
        let storyboardName = "Main"
        let storyboardId = "EntryListViewController"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let entryListViewController = storyboard.instantiateViewController(withIdentifier: storyboardId)

        navigationItem.backBarButtonItem = createMainBackBarButtonItem()
        navigationController?.pushViewController(entryListViewController, animated: true)
    }
    
    private func createMainBackBarButtonItem() -> UIBarButtonItem {
        let backBarButtonTitle = "메인"
        let backBarButtonItem = UIBarButtonItem(title: backBarButtonTitle, style: .plain, target: self, action: nil)
        
        return backBarButtonItem
    }
    
    private func decodeIntroduction() {
        let dataAssetName = "exposition_universelle_1900"
        
        do {
            introduction = try Decoder.decodeJSON(dataAssetName)
        } catch {
            print(error)
        }
    }
    
    private func configureLabels() {
        guard let title = introduction?.title,
              let visitors = introduction?.visitors,
              let location = introduction?.location,
              let duration = introduction?.duration,
              let description = introduction?.description else {
            return
        }
        
        titleLabel.text = title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = ": \(numberFormatter.string(for: visitors) ?? "") 명"
        locationLabel.text = ": \(location)"
        durationLabel.text = ": \(duration)"
        descriptionLabel.text = description
    }
}
