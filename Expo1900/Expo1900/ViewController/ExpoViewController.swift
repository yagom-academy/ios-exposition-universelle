//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {

    @IBOutlet private weak var expoTitleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var KoreaEntryWorkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func loadJsonData() -> ExpoInfo? {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { return nil }
        
        do {
            return try decoder.decode(ExpoInfo.self, from: dataAsset.data)
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func updateUI() {
        let expoInformation = loadJsonData()
        expoTitleLabel.text = expoInformation?.title
        locationLabel.text = expoInformation?.location
        durationLabel.text = expoInformation?.duration
        descriptionLabel.text = expoInformation?.description
        guard let visitors = expoInformation?.visitors else { return }
        visitorsLabel.text = String(visitors) + "명"
    }
    
    @IBAction private func touchUpKoreaEntryWorkButton() {
        guard let koreaEntryWorkViewController = self.storyboard?.instantiateViewController(identifier: "entryWorkVC") as? EntryWorkViewController else { return }
        self.navigationController?.pushViewController(koreaEntryWorkViewController, animated: false)
    }
}

