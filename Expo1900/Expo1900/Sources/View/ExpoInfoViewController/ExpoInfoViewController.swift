//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoInfoViewController: UIViewController {
    
    @IBOutlet private weak var expoTitle: UILabel!
    @IBOutlet private weak var expoItem: UIImageView!
    @IBOutlet private weak var expoVisitors: UILabel!
    @IBOutlet private weak var expoLocation: UILabel!
    @IBOutlet private weak var expoDuration: UILabel!
    @IBOutlet private weak var expoDescription: UITextView!
    
    private var expoInfo: Exposition.ExpositionInfo?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationUI()
        decodeJSONData()
        sendExpositionInfo()
    }
    
    private func configureNavigationUI() {
        let backBarButtonItem = UIBarButtonItem(
            title: "메인",
            style: .plain,
            target: self,
            action: nil
        )
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func decodeJSONData() {
        do {
            expoInfo = try UniverselleDecoder.decodeAssetData(assetName: "exposition_universelle_1900", decoder: JSONDecoder())
            
        } catch {
            let newAlertConfiguration = AlertConfiguration(title: AlertMessage.errorAlertTitle.description, message: AlertMessage.emptyAssetData.description, actionTitle: AlertMessage.confirm.description)
            return ShowAlert.presentAlert(viewController: self, configuration: newAlertConfiguration)
        }
    }
    
    private func sendExpositionInfo() {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitorsCount: String = numberFormatter.string(for: expoInfo?.visitors),
              let location = (expoInfo?.location),
              let duration = (expoInfo?.duration),
              let separatedTitle = expoInfo?.title.split(separator: "(") else {
            let newAlertConfiguration = AlertConfiguration(title: AlertMessage.errorAlertTitle.description, message: AlertMessage.noJSONItems.description, actionTitle: AlertMessage.confirm.description)
            return ShowAlert.presentAlert(viewController: self, configuration: newAlertConfiguration)
        }
        
        let twoLineTitle = "\(separatedTitle[0])\n (\(separatedTitle[1])"
        expoTitle.text = twoLineTitle
        expoItem.image = UIImage(named: "poster")
        expoVisitors.text = "방문객 : \(visitorsCount) 명"
        expoLocation.text = "개최지: \(location)"
        expoDuration.text = "개최 기간 : \(duration)"
        expoDescription.text = expoInfo?.description
    }
    
    @IBAction private func convertEntryItemView(_ sender: UIButton) {
        let secondStoryboard = UIStoryboard(name: "EntryItem", bundle: .main)
        let nextViewController = secondStoryboard.instantiateViewController(withIdentifier: EntryItemViewController.reuseIdentifier)
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
