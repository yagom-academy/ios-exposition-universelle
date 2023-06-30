//
//  Expo1900 - ViewController.swift
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
    
    private var expoGuideData: ExpoGuide?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unwrapData()
        insertLabels()
        navigationItem.title = "메인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    private func unwrapData() {
        do {
            expoGuideData = try ExpoGuide.decode(file: "exposition_universelle_1900")
        } catch {
            print(error.localizedDescription)
        }
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
