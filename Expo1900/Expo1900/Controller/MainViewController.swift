//
//  Expo1900 - MainViewController.swift
//  Created by unchain, bard
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var numberOfVisitors: UILabel!
    @IBOutlet weak var expoLocation: UILabel!
    @IBOutlet weak var expoDuration: UILabel!
    @IBOutlet weak var expoDescription: UILabel!
    var expo: ExpoInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpoInformation()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func fetchExpoInformation() {
        guard let expo = JSONParser.fetch(fileName: "exposition_universelle_1900", parsedItems: expo) else { return }
        self.expo = expo
    }
}
