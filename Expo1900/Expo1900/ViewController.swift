//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var numberOfVisitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var openingPeriodLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBAction func moveByNavigator(_ sender: Any) {
        
    guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
    self.navigationController?.pushViewController(uvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var exposition: ExpoItem
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition") else { return }
        
        do {
            exposition = try jsonDecoder.decode(ExpoItem.self, from: dataAsset.data)
            expoTitleLabel.text = exposition.expoTitle
            numberOfVisitorsLabel.text = "방문객 : \(exposition.numberOfVisitors) 명"
            locationLabel.text = "개최지 : " + exposition.location
            openingPeriodLabel.text = "개최 기간 : " + exposition.openingPeriod
            descriptionLabel.text = exposition.description
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
