//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class Expo1900ViewController: UIViewController {

    @IBOutlet weak var informationTitle: UILabel!
    @IBOutlet weak var informationVisitors: UILabel!
    @IBOutlet weak var informationLocation: UILabel!
    @IBOutlet weak var informationDuration: UILabel!
    @IBOutlet weak var informationDescription: UILabel!
    
    private var expo1900 = Expo1900(title: "", visitors: 0, location: "", duration: "", description: "")
    
    override func viewDidLoad() {
        title = "메인"
        expo1900DecodeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func expo1900DecodeData() {
        let jsonDecoder = JSONDecoder()
        
        guard let expo1900Data = NSDataAsset(name: "exposition_universelle_1900")
        else { return }
        
        do {
            expo1900 = try jsonDecoder.decode(Expo1900.self, from: expo1900Data.data)
        } catch  {
            print("Error")
        }
        
        informationTitle.text = expo1900.title
        informationVisitors.text = "방문객 :\(expo1900.visitors) 명"
        informationLocation.text = "개최지 :" + expo1900.location
        informationDuration.text = "개최 기간 :" + expo1900.duration
        informationDescription.text = expo1900.description

    }
    
}
