//
//  Expo1900 - ViewController.swift
//  Created by jyubong, mireu
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ExpositionHomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var exposition: Exposition?
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeExposition()
        configureUI()
        self.setUpBackButtonAccessibilityLabel(to: AccessibilityLabelList.home)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        appDelegate?.sholdSupportAllOrientation = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        appDelegate?.sholdSupportAllOrientation = true
    }
    
    private func decodeExposition() {
        do {
            exposition = try AssetDecoder<Exposition>().parse(assetName: AssetNameList.exposition)
        } catch {
            self.showErrorAlert(error)
        }
    }
    
    private func configureUI () {
        titleLabel.text = exposition?.titleDescription
        visitorsLabel.text = exposition?.visitorsDescription
        locationLabel.text = exposition?.locationDescription
        durationLabel.text = exposition?.durationDescription
        descriptionLabel.text = exposition?.description
    }

}
