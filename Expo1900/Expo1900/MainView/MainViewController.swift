//
//  Expo1900 - FirstViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var titleImageView: UIImageView!
  @IBOutlet var visitorsLabel: UILabel!
  @IBOutlet var locationLabel: UILabel!
  @IBOutlet var durationLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  @IBOutlet var button: UIButton!
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.isNavigationBarHidden = true
  }
  
  override func viewDidLoad() {
    NotificationCenter.default.addObserver(self, selector: #selector(adjustButtonDynamicType), name: UIContentSizeCategory.didChangeNotification, object: nil)
    updateUI()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.isNavigationBarHidden = false
  }
  
  @objc func adjustButtonDynamicType() {
    button.titleLabel?.adjustsFontForContentSizeCategory = true
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

