//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillLabels()
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

    func fillLabels() {
        var expoGuideData = ExpoGuide()
        
        do {
            expoGuideData = try ExpoGuide.decode(file: "exposition_universelle_1900")
        } catch {}
        
        titleLabel.text = expoGuideData.title?.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = expoGuideData.visitors?.changeToDecimalStylePopulation()
        locationLabel.text = expoGuideData.location
        durationLabel.text = expoGuideData.duration
        descriptionLabel.text = expoGuideData.description
    }
    
    
    @IBAction func tappedEntryListButton(_ sender: UIButton) {
        guard let entryListView = self.storyboard?.instantiateViewController(withIdentifier: "entryList") else {
            return
        }
        
        navigationController?.pushViewController(entryListView, animated: true)
    }
}
