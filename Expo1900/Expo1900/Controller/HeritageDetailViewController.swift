//
//  HeritageDetailViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

final class HeritageDetailViewController: UIViewController {
  
  private let heritage: Heritage
  
  init(heritage: Heritage) {
    self.heritage = heritage
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
  }
}
