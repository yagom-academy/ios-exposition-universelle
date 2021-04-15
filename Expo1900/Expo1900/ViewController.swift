//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let expoData = try? JSONConverter<ExpoOfParis>.parse(assetName: "exposition_universelle_1900").get()
    
    @IBOutlet weak var expoTitleLabel: UILabel!
    @IBOutlet weak var expoPosterImage: UIImageView!
    @IBOutlet weak var expoVisitors: UILabel!
    @IBOutlet weak var expoVenu: UILabel!
    @IBOutlet weak var expoDuration: UILabel!
    @IBOutlet weak var expoDescription: UILabel!
    @IBOutlet weak var buttonLeftImage: UIImageView!
    @IBOutlet weak var buttonRightImage: UIImageView!
    @IBOutlet weak var koreanHeritageButton: UIButton!
    
    
    
    func inputData() {
        guard let newLinedExpoTitle = expoData?.title else { return }
        
        expoTitleLabel.text = insertNewLine(by: "(", into: newLinedExpoTitle)
        expoPosterImage.image = UIImage(named: "poster")
        expoVisitors.text = insert명(at: String(commaMaker(value: expoData?.visitors ?? 0)))
        expoVenu.text = expoData?.location
        expoDuration.text = expoData?.duration
        expoDescription.text = expoData?.description
        buttonLeftImage.image = UIImage(named: "flag")
        buttonRightImage.image = UIImage(named: "flag")
    }
    
    @IBAction func koreanHeritageButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData()
    }
}
