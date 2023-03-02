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
    
    private var fetchedMainExposition: MainExposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMainExposition()
        setupLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        switchViewAllOrientation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        switchViewAllOrientation()
    }
    
    private func switchViewAllOrientation() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.isViewAllOrientation.toggle()
    }
    
    private func fetchMainExposition() {
        fetchedMainExposition = ExpositionParser.mainExpositionParse()
    }
    
    private func setupLabel() {
        guard let exposition = fetchedMainExposition else { return }
        
        mainTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = "방문객 : \(exposition.visitor.convertedString)"
        locationLabel.text = "개최지 : \(exposition.location)"
        durationLabel.text = "개최 기간 : \(exposition.duration)"
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

