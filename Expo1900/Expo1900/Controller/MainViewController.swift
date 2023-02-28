//
//  Expo1900 - MainViewController.swift
//  Created by goat, vetto. 
//  Copyright © goat, vetto. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    private var parsedMainData: MainExposition?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchParsedData()
        setupLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        appDelegate.setupViewAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appDelegate.setupViewAllOrientation = true
    }
    
    private func fetchParsedData() {
        parsedMainData = ExpositionParser.mainExpositionParse()
    }
    
    private func setupLabel() {
        guard let exposition = parsedMainData else { return }
        
        mainTitleLabel.text = exposition.title
        visitorsLabel.text = "방문객 : " + NumberFormatter.convertToNumber(from: exposition.visitor)
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

