//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var parisExposition: Exposition!
    var items: [Entry]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
        dump(items)
        dump(parisExposition)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true

        titleLabel.text = parisExposition.title
        visitorsLabel.text = "방문객 : " + String(parisExposition.visitors)
        locationLabel.text = "개최지 : " + parisExposition.location
        durationLabel.text = "개최 기간 : " + parisExposition.duration
        descriptionTextView.text = parisExposition.description
    }
    
    private func decodeData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        
        do {
            self.parisExposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            debugPrint("ERROR")
        }
        
        guard let dataAsset2 = NSDataAsset(name: "items") else { return }
        
        do {
            self.items = try jsonDecoder.decode([Entry].self, from: dataAsset2.data)
        } catch {
            debugPrint("ERROR2")
        }
    }
}

