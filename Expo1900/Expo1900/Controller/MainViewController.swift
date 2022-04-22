//
//  Expo1900 - MainViewController.swift
//  Created by Lingo, Mino
// 

import UIKit

fileprivate extension Constants {
  static let notice = "알림"
  static let confirm = "확인"
  static let visitorPrefix = "방문객 : "
  static let visitorSuffix = "%@ 명"
  static let locationPrefix = "개최지 : "
  static let durationPrefix = "개최 기간 : "
  static let bracket = "("
  static let spacingBracket = "\n("
}

final class MainViewController: UIViewController {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var posterImageView: UIImageView!
  @IBOutlet private weak var visitorsPrefixLabel: UILabel!
  @IBOutlet private weak var visitorsSuffixLabel: UILabel!
  @IBOutlet private weak var locationPrefixLabel: UILabel!
  @IBOutlet private weak var locationSuffixLabel: UILabel!
  @IBOutlet private weak var durationPrefixLabel: UILabel!
  @IBOutlet private weak var durationSuffixLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
    self.lockOrientation(.portrait, andRotateTo: .portrait)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.parse()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
    self.setOrientationLock(.all)
  }
}

// MARK: - Private Extension

extension MainViewController: AlertPresentable, Orientating {
  
  private func parse() {
    let parsedResult = Expo.parseJSON(with: AssetName.expo)
    switch parsedResult {
    case let .success(expo):
      self.setUpView(from: expo)
    case let .failure(error):
      let alert = self.makeAlertController(
        title: Constants.notice,
        message: error.localizedDescription,
        preferredStyle: .alert,
        actions: [UIAlertAction(title: Constants.confirm, style: .default)]
      )
      self.present(alert, animated: true)
    }
  }
  
  private func setUpView(from expo: Expo) {
    self.titleLabel.text = expo.title.replacingOccurrences(
      of: Constants.bracket,
      with: Constants.spacingBracket
    )
    self.posterImageView.image = UIImage(named: AssetName.poster)
    self.visitorsPrefixLabel.text = Constants.visitorPrefix
    self.visitorsSuffixLabel.text = String(
      format: Constants.visitorSuffix,
      expo.visitors.toDecimal()
    )
    self.locationPrefixLabel.text = Constants.locationPrefix
    self.locationSuffixLabel.text = expo.location
    self.durationPrefixLabel.text = Constants.durationPrefix
    self.durationSuffixLabel.text = expo.duration
    self.descriptionLabel.text = expo.description
    
    self.visitorsSuffixLabel.adjustsFontSizeToFitWidth = true
    self.locationSuffixLabel.adjustsFontSizeToFitWidth = true
    self.durationSuffixLabel.adjustsFontSizeToFitWidth = true
  }
}
