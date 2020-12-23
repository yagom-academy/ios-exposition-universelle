//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var parisExpositionInformation: ParisExpositionInformation?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        decodeJSON()
        setAllData()
    }
    
    @IBAction func touchUpMoveToNextButton(_ sender: UIButton) {
        guard let pushVC = self.storyboard?.instantiateViewController(identifier: "KoreanExpositionPage") else {
            return
        }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func decodeJSON() {
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
          parisExpositionInformation = try decoder.decode(ParisExpositionInformation.self, from: dataAsset.data)
        } catch {
            print(error)
            return
        }
    }
    
    func setAllData() {
        guard let parisExopsitionTitle = parisExpositionInformation?.title else {
            return
        }
        guard let parisExopsitionVisitors = parisExpositionInformation?.visitorsWithComma else {
            return
        }
        guard let parisExopsitionLocation = parisExpositionInformation?.location else {
            return
        }
        guard let parisExopsitionDuration = parisExpositionInformation?.duration else {
            return
        }
        guard let parisExopsitionDescription = parisExpositionInformation?.description else {
            return
        }
        
        titleLabel.text = parisExopsitionTitle
        visitorsLabel.text = parisExopsitionVisitors + " 명"
        locationLabel.text = parisExopsitionLocation
        durationLabel.text = parisExopsitionDuration
        descriptionLabel.text = parisExopsitionDescription
    }
    
    // MARK: 첫 화면, Navigation Bar 컨트롤
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = "메인"
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
