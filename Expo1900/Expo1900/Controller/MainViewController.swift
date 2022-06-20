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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = NSDataAsset(name: "exposition_universelle_1900")?.data else { return }
        guard let decodedData = try? JSONDecoder().decode(ExpoInformation.self, from: data) else { return }
        let headTitle = decodedData.title.split(separator: "(")

        expoTitle.text = headTitle[0] + "\n(\(headTitle[1])"
        posterImage.image = UIImage(named: "poster")
        
        numberOfVisitors.text = "방문객 : " + (decodedData.visitors.formatNumber() ?? "")  + "명"
        expoLocation.text = "개최지 : " + decodedData.location
        expoDuration.text = "개최 기간 : " + decodedData.duration
        expoDescription.text = decodedData.description
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.topItem?.title = "메인"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
