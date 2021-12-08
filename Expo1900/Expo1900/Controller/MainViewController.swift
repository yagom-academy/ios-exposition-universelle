//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        parsing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func parsing() {
        let expoFileName = "exposition_universelle_1900"
        let parsedResult = JSONParse<Exposition>.decode(fileName: expoFileName)
        
        switch parsedResult {
        case .failure(let parsingError):
            showAlert(message: parsingError.errorDescription ?? parsingError.localizedDescription)
            return
        case .success(let contents):
            setUpView(contents: contents)
        }
    }
    
    func setUpView(contents: Exposition) {
        titleLabel.text = contents.title
        visitorsLabel.text = contents.visitors.description
        locationLabel.text = contents.location
        durationLabel.text = contents.duration
        descriptionLabel.text = contents.description
        posterImageView.image = UIImage(named: "poster")
    }
}
