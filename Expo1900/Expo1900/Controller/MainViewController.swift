//
//  Expo1900 - MainViewController.swift
//  Created by Lingo, Mino
// 

import UIKit

final class MainViewController: UIViewController {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var posterImageView: UIImageView!
  @IBOutlet private weak var visitorsLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction private func didTapShowExpoItemsButton(_ sender: UIButton) {
  }
}
