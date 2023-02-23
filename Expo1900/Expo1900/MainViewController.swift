//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var exposition: MainExposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJsonData()
        setupLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func getJsonData() {
        let jsonDecoder = JSONDecoder()
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        
        do {
            exposition = try jsonDecoder.decode(MainExposition.self, from: jsonData.data)
        } catch {
            return
        }
    }
    
    private func setupLabel() {
        guard let title = exposition?.title else { return }
        guard let expositionVisitor = exposition?.visitors else { return }
        guard let expositionLocation = exposition?.location else { return }
        guard let expositionPeriod = exposition?.duration else { return }
        guard let expositionText = exposition?.description else { return }
        
        mainTitleLabel.text = title
        visitorsLabel.text = "방문객 : \(expositionVisitor)"
        locationLabel.text = "개최지 : \(expositionLocation)"
        durationLabel.text = "개최 기간 : \(expositionPeriod)"
        textLabel.text = expositionText
    }

    @IBAction func moveToListViewController(_ sender: UIButton) {
        guard let expoListVC = self.storyboard?.instantiateViewController(withIdentifier: "ExpositionListViewController") as? ExpositionListViewController else { return }
        
        let backBarButtonItem = UIBarButtonItem(title: "메인", style: .plain, target: ExpositionListViewController.self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.pushViewController(expoListVC , animated: true)
    }
}

