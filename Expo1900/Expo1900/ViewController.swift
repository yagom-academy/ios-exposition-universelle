//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var visitors: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var openPeriod: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var exposition: MainExposition?
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            exposition = try jsonDecoder.decode(MainExposition.self, from: jsonData.data)
        } catch {
            return
        }
        
        guard let title = exposition?.title else { return }
        guard let expositionVisitor = exposition?.visitors else { return }
        guard let expositionLocation = exposition?.location else { return }
        guard let expositionPeriod = exposition?.duration else { return }
        guard let expositionText = exposition?.description else { return }
        
        mainTitle.text = title
        visitors.text = "방문객 : \(expositionVisitor)"
        location.text = "개최지 : \(expositionLocation)"
        openPeriod.text = "개최 기간 : \(expositionPeriod)"
        textLabel.text = expositionText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    

    @IBAction func moveToListViewController(_ sender: UIButton) {
        guard let expoListVC = self.storyboard?.instantiateViewController(withIdentifier: "ExpositionListViewController") as? ExpositionListViewController else { return }

        self.navigationController?.pushViewController(expoListVC , animated: true)
    }
    
}

