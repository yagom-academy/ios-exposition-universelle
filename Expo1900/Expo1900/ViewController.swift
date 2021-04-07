//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var titleImageView: UIImageView!
  @IBOutlet var visitorsLabel: UILabel!
  @IBOutlet var locationLabel: UILabel!
  @IBOutlet var durationLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  func updateUI() {
    let jsonFile = JsonFile(fileName: "exposition_universelle_1900")
    do {
      let expositionUniverselle = try jsonFile.decode(type: Exposition())

      titleLabel.text = expositionUniverselle.title
      titleImageView.image = UIImage(named: "poster.jpg")
      visitorsLabel.text = "\(expositionUniverselle.visitors)"
      locationLabel.text = expositionUniverselle.location
      durationLabel.text = expositionUniverselle.duration
      descriptionLabel.text = expositionUniverselle.description
    } catch {
      print(error)
    }
    
    
  }
}

