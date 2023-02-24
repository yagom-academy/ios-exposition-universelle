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
    
    private var exposition: MainExposition?
    
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
        
        guard let jsonData: NSDataAsset = NSDataAsset(name: JsonFile.mainExposition) else { return }
        
        do {
            exposition = try jsonDecoder.decode(MainExposition.self, from: jsonData.data)
        } catch {
            return
        }
    }
    
    private func setupLabel() {
        guard let exposition = exposition else { return }
        
        mainTitleLabel.text = exposition.title
        visitorsLabel.text = "방문객 : \(exposition.visitors)"
        locationLabel.text = "개최지 : \(exposition.location)"
        durationLabel.text = "개최 기간 : \(exposition.location)"
        textLabel.text = exposition.description
    }

    @IBAction func moveToListViewController(_ sender: UIButton) {
        guard let expoListVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.expositionListViewController) as? ExpositionListViewController else { return }
        
        expoListVC.navigationItem.title = Title.itemsOfKorea
        let backBarButtonItem = UIBarButtonItem(title: Title.main, style: .plain, target: ExpositionListViewController.self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.pushViewController(expoListVC , animated: true)
    }
}

