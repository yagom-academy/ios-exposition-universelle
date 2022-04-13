//
//  HeritageViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

class HeritageViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
    title = "한국의 출품작"
  }
}
