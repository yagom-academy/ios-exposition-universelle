//
//  Expo1900 - ExpoViewController.swift
//  Created by Taeangel, dudu on 2022/04/11.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
  }
  
  private func prepareData() -> (Expo, UIImage)? {
    guard let expo = ParseManager<Expo>.parse(name: "exposition_universelle_1900") else {
      return nil
    }
    guard let poster = UIImage(named: "poster") else {
      return nil
    }
    
    return (expo, poster)
  }
}

