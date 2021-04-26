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
    @IBOutlet weak var screenTransitionToTableViewButton: UIButton!
    var expo: Expo?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try setupInitialScreenView()
        } catch {
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override open var shouldAutorotate: Bool {
            return false
        }
    
    private func setupInitialScreenView() throws {
        do {
            try parseExpoData()
            updateUI()
            setAttributeOfLabel()
            
        } catch {
            throw DataError.InvalidAccess
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
        expoVisitors.adjustsFontSizeToFitWidth = true
        expoLocation.adjustsFontSizeToFitWidth = true
        expoDuration.adjustsFontSizeToFitWidth = true
        expoDescription.adjustsFontSizeToFitWidth = true
        expoDescription.lineBreakStrategy = .hangulWordPriority
        screenTransitionToTableViewButton.titleLabel?.adjustsFontForContentSizeCategory = true
        screenTransitionToTableViewButton.titleLabel?.numberOfLines = 0
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

// Mark UINavigationController extension

extension UINavigationController {
    override open var shouldAutorotate: Bool {
        get {
            if let visibleViewController = visibleViewController {
                return visibleViewController.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
}
