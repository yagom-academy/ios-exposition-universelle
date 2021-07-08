//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainVisitor: UILabel!
    @IBOutlet weak var mainLocation: UILabel!
    @IBOutlet weak var mainDuration: UILabel!
    @IBOutlet weak var mainDescription: UILabel!
    @IBOutlet weak var moveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        guard let expo = try? jsonDecoder.decode(InformationOfExpo.self, from: dataAsset.data) else { return }
        
        inputData(expo)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func inputData(_ expo: InformationOfExpo) {
        mainTitle.text = expo.title
        mainVisitor.text = expo.visitorsWithComma
        mainLocation.text = expo.location
        mainDuration.text = expo.duration
        mainDescription.text = expo.description
    }
    
    @IBAction func moveSecond(_ sender: UIButton) {
        
        guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return
        }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}


