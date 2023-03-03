//
//  Expo1900 - MainViewController.swift
//  Created by goat, vetto. 
//  Copyright © goat, vetto. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var visitorTitleLabel: UILabel!
    @IBOutlet weak var locationTitleLabel: UILabel!
    @IBOutlet weak var durationTitleLabel: UILabel!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    private var mainExposition: MainExposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMainExposition()
        setupLabel()
        setupNavigationTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
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
        mainExposition = ExpositionParser.mainExpositionParse()
    }
    
    private func setupLabel() {
        guard let exposition = mainExposition else { return }
        
        visitorTitleLabel.text = "방문객"
        locationTitleLabel.text = "개최지"
        durationTitleLabel.text = "개최기간"
        
        visitorTitleLabel.font = .preferredFont(forTextStyle: .title3)
        visitorTitleLabel.adjustsFontForContentSizeCategory = true
        
        locationTitleLabel.font = .preferredFont(forTextStyle: .title3)
        locationTitleLabel.adjustsFontForContentSizeCategory = true
        
        durationTitleLabel.font = .preferredFont(forTextStyle: .title3)
        durationTitleLabel.adjustsFontForContentSizeCategory = true
        
        mainTitleLabel.text = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitorsLabel.text = Symbol.blankAndColon + exposition.visitor.convertedString
        locationLabel.text = Symbol.blankAndColon + exposition.location
        durationLabel.text = Symbol.blankAndColon + exposition.duration
        textLabel.text = exposition.description
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = Title.main
    }

    @IBAction func moveToListViewController(_ sender: UIButton) {
        guard let expoListVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.expositionListViewController) as? ExpositionListViewController else { return }
        
        self.navigationController?.pushViewController(expoListVC , animated: true)
    }
}

