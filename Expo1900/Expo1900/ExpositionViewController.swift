//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        setNavigationTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func updateLabels() {
        do {
            let expostion = try Exposition()
            titleLabel.text = expostion.title
            visitorsLabel.text = "방문객 : \(expostion.visitors.decimalString) 명"
            locationLabel.text = "개최지 : \(expostion.location)"
            durationLabel.text = "개최 기간 : \(expostion.duration)"
            descriptionLabel.text = expostion.description
        } catch Expo1900Error.dataNotFoundInAsset(let fileName) {
            print(Expo1900Error.dataNotFoundInAsset(fileName).description)
        } catch {
            print(error)
        }
    }
    
    func setNavigationTitle() {
        self.navigationItem.title = "메인"
    }
}

