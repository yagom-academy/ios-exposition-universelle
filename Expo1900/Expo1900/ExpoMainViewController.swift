//
//  Expo1900 - ViewController.swift
//  Created by sunnyCookie, Wonbi
// 

import UIKit

class ExpoMainViewController: UIViewController {
    var expoInformation: ExpoInformation?
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet var flagImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let expoInformationData = JSONDecoder.decode(
            ExpoInformation.self,
            from: "exposition_universelle_1900"
        ) else { return }
        
        expoInformation = expoInformationData
    }
    
    
    
    
}
