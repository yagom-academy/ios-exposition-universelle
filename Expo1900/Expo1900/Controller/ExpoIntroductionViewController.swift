//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoIntroductionViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var expoPoster: UIImageView!
  @IBOutlet weak var numberOfVisitorsLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    var expoIntroduction: ExpoIntroduction?
    let jsonDecoder = CustomJSONDecoder()
    
    do {
      expoIntroduction = try jsonDecoder.decode(to: ExpoIntroduction.self, from: "exposition_universelle_1900")
    } catch {
      print(error.localizedDescription)
    }
    
    titleLabel.text = expoIntroduction?.title
    expoPoster.image = UIImage(named: "poster")
    numberOfVisitorsLabel.text = "\(String(describing: expoIntroduction?.visitors ?? 0))"
    locationLabel.text = expoIntroduction?.location
    durationLabel.text = expoIntroduction?.duration
    descriptionTextView.text = expoIntroduction?.description
    
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
  }
  
  
}

