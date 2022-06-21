//
//  Expo1900 - MainViewController.swift
//  Created by unchain, bard
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private(set) weak var expoTitle: UILabel!
    @IBOutlet private(set) weak var posterImage: UIImageView!
    @IBOutlet private(set) weak var numberOfVisitors: UILabel!
    @IBOutlet private(set) weak var expoLocation: UILabel!
    @IBOutlet private(set) weak var expoDuration: UILabel!
    @IBOutlet private(set)  weak var expoDescription: UILabel!
    var expo: ExpoInformation?
    
    @IBAction private func entryListbuttonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "EntryList", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "EntryList") as? EntryListViewController else { return }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchExpoInformation()
        self.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func fetchExpoInformation() {
        guard let expo = JSONParser.fetch(fileName: ExpoNameSpace.expoInformationJSONFileName.name, parsedItems: expo) else { return }
        self.expo = expo
    }
}
