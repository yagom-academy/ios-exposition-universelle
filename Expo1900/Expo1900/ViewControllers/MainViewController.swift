//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var expoVisitors: UILabel!
    @IBOutlet weak var expoLocation: UILabel!
    @IBOutlet weak var expoDuration: UILabel!
    @IBOutlet weak var expoDescription: UILabel!
    var expo: Expo?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialScreenView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    func setupInitialScreenView() {
        do {
            try parseExpoData()
            guard let expoData = expo else { return }
            expoTitle.text = expoData.title
            expoTitle.text = expoData.title.replacingOccurrences(of: "(", with: "\n(")
            expoTitle.adjustsFontSizeToFitWidth = true
            expoTitle.translatesAutoresizingMaskIntoConstraints = false
            expoVisitors.text = "방문객 : " + format(expoData.visitors)
            expoVisitors.adjustsFontSizeToFitWidth = true
            expoVisitors.translatesAutoresizingMaskIntoConstraints = false
            expoLocation.text = "개최지 : " + expoData.location
            expoLocation.adjustsFontSizeToFitWidth = true
            expoLocation.translatesAutoresizingMaskIntoConstraints = false
            expoDuration.text = "개최 기간 :" + expoData.duration
            expoDuration.adjustsFontSizeToFitWidth = true
            expoDuration.translatesAutoresizingMaskIntoConstraints = false
            expoDescription.text = expoData.description
            expoDescription.adjustsFontSizeToFitWidth = true
            expoDescription.translatesAutoresizingMaskIntoConstraints = false
            expoDescription.lineBreakStrategy = .hangulWordPriority
        } catch {
        }
    }
    
    func format(_ input: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let result = formatter.string(for: input) else {
            return ""
        }
        return result
    }
    
    func parseExpoData() throws {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            expo = try JSONDecoder().decode(Expo.self, from: asset.data)
        } catch {
            throw DataError.InvalidAccess
        }
    }
}
