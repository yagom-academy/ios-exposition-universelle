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
    self.configure()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
  }
  
  @IBAction private func didTapShowExpoItemsButton(_ sender: UIButton) {
  }
}

private extension MainViewController {
  
  func configure() {
    self.navigationController?.isNavigationBarHidden = true
    self.parse()
  }
  
  func parse() {
    let parsedResult = Expo.decode(with: AssetName.expo)
    guard let expo = try? parsedResult.get() else {
      return
    }
    self.setUpView(from: expo)
  }
  
  func setUpView(from expo: Expo) {
    self.titleLabel.text = expo.title.replacingOccurrences(of: "(", with: "\n(")
    self.posterImageView.image = UIImage(named: AssetName.poster)
    self.visitorsLabel.text = "방문객 : \(expo.visitors.toDecimal()) 명"
    self.locationLabel.text = "개최지 : \(expo.location)"
    self.durationLabel.text = "개최 기간 : \(expo.duration)"
    self.descriptionLabel.text = expo.description
  }
}
