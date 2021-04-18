//
//  Expo1900 - ExpoViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {

    @IBOutlet private weak var expoTitleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var KoreaEntryWorkButton: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch loadJsonData() {
        case .success(let data):
            updateUI(data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        appDelegate.shouldSupportAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate.shouldSupportAllOrientation = true
    }
    
    private func loadJsonData() -> Result<ExpoInfo, DataError> {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { return .failure(.incorrectAssert) }
            
        if let data = try? decoder.decode(ExpoInfo.self, from: dataAsset.data) {
            return .success(data)
        } else {
            return .failure(.failDecoding)
        }
    }
    
    private func updateUI(_ expoInformation: ExpoInfo) {
        expoTitleLabel.text = expoInformation.title.replacingOccurrences(of: "(", with: "\n(")
        locationLabel.text = expoInformation.location
        durationLabel.text = expoInformation.duration
        descriptionLabel.text = expoInformation.description
        guard let formattedVisitors = changeNumberStyleToComma(expoInformation.visitors) else { return }
        visitorsLabel.text = formattedVisitors + " 명"
    }
    
    private func changeNumberStyleToComma(_ number: Int) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number)
    }
    
    @IBAction private func touchUpKoreaEntryWorkButton() {
        guard let koreaEntryWorkViewController = self.storyboard?.instantiateViewController(identifier: "entryWorkVC") as? EntryWorkViewController else { return }
        self.navigationController?.pushViewController(koreaEntryWorkViewController, animated: true)
    }
}

