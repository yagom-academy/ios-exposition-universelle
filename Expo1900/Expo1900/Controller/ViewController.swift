//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainVisitor: UILabel!
    @IBOutlet weak var mainLocation: UILabel!
    @IBOutlet weak var mainDuration: UILabel!
    @IBOutlet weak var mainDescription: UILabel!
    @IBOutlet weak var leftKoreaImage: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var rightKoreaImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "exposition_universelle1900") else { return }
        guard let expo = try? jsonDecoder.decode(InformationOfExpo.self, from: dataAsset.data) else { return }
        
        inputData(expo)
        
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


