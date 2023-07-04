//
//  Expo1900 - ViewController.swift
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
    
    private var expoGuideData: ExpoGuide?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expoGuideData = Data.unwrap(type: expoGuideData, file: "exposition_universelle_1900")
        insertLabels()
        navigationItem.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        appDelegate.isOnlyPortaitOrientation = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        appDelegate.isOnlyPortaitOrientation = false
    }
    
    private func insertLabels() {
        titleLabel.text = expoGuideData?.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = expoGuideData?.visitorsText
        locationLabel.text = expoGuideData?.location
        durationLabel.text = expoGuideData?.duration
        descriptionLabel.text = expoGuideData?.description
    }
    
    @IBAction private func tappedEntryListButton(_ sender: UIButton) {
        guard let entryListViewController = self.storyboard?.instantiateViewController(withIdentifier: "entryListViewController") else {
            return
        }
        
        navigationController?.pushViewController(entryListViewController, animated: true)
    }
}
