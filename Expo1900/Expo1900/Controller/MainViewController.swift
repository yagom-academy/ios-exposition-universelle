//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
   
    //MARK: - IBOulet
    @IBOutlet weak private var mainTitleLabel: UILabel!
    @IBOutlet weak private var mainVisitorLabel: UILabel!
    @IBOutlet weak private var mainLocationLabel: UILabel!
    @IBOutlet weak private var mainDurationLabel: UILabel!
    @IBOutlet weak private var mainDescriptionLabel: UILabel!
    
    //MARK: - Property
    private var jsonDecoder = JsonDecoder()
    private let heritageTableViewControllerIdentifier = "SecondVC"
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUniverselleInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Method
    
    private func fetchUniverselleInfo() {
        guard let value = try? jsonDecoder.decode(name: "exposition_universelle_1900", type: InformationOfExpo.self) else {
            return
        }
        updateMainView(value)
    }
    
    private func updateMainView(_ expo: InformationOfExpo) {
        mainTitleLabel.text = expo.title
        mainVisitorLabel.text = "방문객 : " + expo.visitorsWithComma + "명"
        mainLocationLabel.text = "개최지 : " + expo.location
        mainDurationLabel.text = "개최 기간 : " + expo.duration
        mainDescriptionLabel.text = expo.description
    }
    
    // MARK: - IBAction
    @IBAction private func moveHeritageTableVC(_ sender: UIButton) {
        guard let convertHeritageTableViewController = self.storyboard?.instantiateViewController(withIdentifier: self.heritageTableViewControllerIdentifier) else { return }
        self.navigationController?.pushViewController(convertHeritageTableViewController, animated: true)
    }
    
}


