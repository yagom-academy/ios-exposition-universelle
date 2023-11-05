//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoInfoViewController: UIViewController {
    
    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var expoItem: UIImageView!
    @IBOutlet weak var expoVisitors: UILabel!
    @IBOutlet weak var expoLocation: UILabel!
    @IBOutlet weak var expoDuration: UILabel!
    @IBOutlet weak var expoDescription: UITextView!
    
    var expoInfo: Exposition.ExpositionInfo?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationUI()
        decodeJSONData()
        sendExpositionInfo()
    }
    
    func configureNavigationUI() {
        let backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func decodeJSONData() {
        guard let asset = NSDataAsset.init(name: "exposition_universelle_1900") else { return }
        
        do {
            let decoder = JSONDecoder()
            expoInfo = try decoder.decode(Exposition.ExpositionInfo.self, from: asset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func sendExpositionInfo() {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let visitorsCount: String = numberFormatter.string(for: expoInfo?.visitors),
              let unwrapedLocation = (expoInfo?.location),
              let unwrapedDuration = (expoInfo?.duration),
              let separatedTitle = expoInfo?.title.split(separator: "(") else { return }
        
        let twoLineTitle = "\(separatedTitle[0])\n (\(separatedTitle[1])"
        expoTitle.text = twoLineTitle
        expoItem.image = UIImage(named: "poster")
        expoVisitors.text = "방문객 : \(visitorsCount) 명"
        expoLocation.text = "개최지: \(unwrapedLocation)"
        expoDuration.text = "개최 기간 : \(unwrapedDuration)"
        expoDescription.text = expoInfo?.description
    }
    
    @IBAction func convertEntryItemView(_ sender: UIButton) {
        let secondStoryboard = UIStoryboard(name: "EntryItem", bundle: .main)
        let nextViewController = secondStoryboard.instantiateViewController(withIdentifier: "EntryItemViewController")
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
