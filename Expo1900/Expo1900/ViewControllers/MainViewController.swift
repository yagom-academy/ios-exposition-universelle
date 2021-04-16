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
    @IBOutlet weak var changeViewToItemTableViewButton: UIButton!
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
    
    
    private func setupInitialScreenView() {
        do {
            try parseExpoData()
            updateUI()
            setAttributeOfLabel()
            
        } catch {
        }
    }
    
    private func updateUI() {
        guard let expoData = expo else { return }
        expoTitle.text = expoData.title
        expoTitle.text = expoData.title.replacingOccurrences(of: "(", with: "\n(")
        expoLocation.text = "개최지 : " + expoData.location
        expoVisitors.text = "방문객 : " + formatNumberStyle(expoData.visitors) + " 명"
        expoDuration.text = "개최 기간 :" + expoData.duration
        expoDescription.text = expoData.description
    }
    
    private func setAttributeOfLabel() {
        expoTitle.adjustsFontSizeToFitWidth = true
//        expoTitle.translatesAutoresizingMaskIntoConstraints = false
        expoVisitors.adjustsFontSizeToFitWidth = true
//        expoVisitors.translatesAutoresizingMaskIntoConstraints = false
        expoLocation.adjustsFontSizeToFitWidth = true
//        expoLocation.translatesAutoresizingMaskIntoConstraints = false
        expoDuration.adjustsFontSizeToFitWidth = true
//        expoDuration.translatesAutoresizingMaskIntoConstraints = false
        expoDescription.adjustsFontSizeToFitWidth = true
//        expoDescription.translatesAutoresizingMaskIntoConstraints = false
        expoDescription.lineBreakStrategy = .hangulWordPriority
//        changeViewToItemTableViewButton.titleLabel?.adjustsFontSizeToFitWidth = true
        changeViewToItemTableViewButton.titleLabel?.adjustsFontForContentSizeCategory = true
        changeViewToItemTableViewButton.titleLabel?.numberOfLines = 0
    }
    
    private func formatNumberStyle(_ input: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let result = formatter.string(for: input) else {
            return String(input)
        }
        return result
    }
    
    private func parseExpoData() throws {
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
