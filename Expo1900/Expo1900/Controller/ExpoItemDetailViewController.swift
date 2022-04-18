//
//  ExpoItemDetailViewController.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/14.
//

import UIKit

final class ExpoItemDetailViewController: UIViewController {
  
  @IBOutlet private weak var expoItemImageView: UIImageView!
  @IBOutlet private weak var expoItemDescriptionLabel: UILabel!
  
  private var expoItem: ExpoItem?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUpView()
  }
}

// MARK: - Set Up

extension ExpoItemDetailViewController {
  
  func setUpExpoItem(_ expoItem: ExpoItem) {
    self.expoItem = expoItem
  }
  
  private func setUpView() {
    guard let expoItem = self.expoItem else {
      return
    }
    self.navigationItem.title = expoItem.name
    self.expoItemImageView.image = UIImage(named: expoItem.imageName)
    self.expoItemDescriptionLabel.text = expoItem.description
  }
}
