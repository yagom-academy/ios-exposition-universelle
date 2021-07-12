//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class WorldsExpoViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var introductionImageView: UIImageView!
    @IBOutlet weak private var visitorCountLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        queryData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK:- Bind data with contents
extension WorldsExpoViewController {
    private func queryData() {
        let expoIntroductionFileName = "exposition_universelle_1900"
        let parsedResult = ParsingManager.shared.parse(name: expoIntroductionFileName, to: ExpoIntroduction.self)
        
        switch parsedResult {
        case .success(let introductionContents):
            bind(with: introductionContents)
        case .failure(let parsingError):
            showAlert(error: parsingError)
        }
    }
    
    private func bind(with introductionContents: ExpoIntroduction) {
        titleLabel.text = introductionContents.title
        visitorCountLabel.text = String(introductionContents.visitors)
        locationLabel.text = introductionContents.location
        durationLabel.text = introductionContents.duration
        descriptionTextView.text = introductionContents.description
    }
}
