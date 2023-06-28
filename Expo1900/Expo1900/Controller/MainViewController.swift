//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var introduction: Introduction?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        decodeIntroduction()
        configureLabels()
    }

    @IBAction func touchUpGoToEntryListButton(_ sender: UIButton) {
        let storyboardName = "Main"
        let storyboardId = "EntryListViewController"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)

        self.navigationItem.backBarButtonItem = createMainBackBarButtonItem()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func createMainBackBarButtonItem() -> UIBarButtonItem {
        let backBarButtonTitle = "메인"
        let backBarButtonItem = UIBarButtonItem(title: backBarButtonTitle, style: .plain, target: self, action: nil)
        
        return backBarButtonItem
    }
    
    private func decodeIntroduction() {
        let dataAssetName = "exposition_universelle_1900"
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: dataAssetName) else {
            return
        }
        
        do {
            introduction = try decoder.decode(Introduction.self, from: dataAsset.data)
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
        
        titleLabel.text = title
        visitorsLabel.text = String(visitors)
        locationLabel.text = location
        durationLabel.text = duration
        descriptionLabel.text = description
    }
}
