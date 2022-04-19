//
//  Expo1900 - MainViewController.swift
//  Created by Lingo, Mino
// 

import UIKit

fileprivate extension Constants {
  static let notice = "알림"
  static let confirm = "확인"
  static let visitor = "방문객 : %@ 명"
  static let location = "개최지 : "
  static let duration = "개최 기간 : "
  static let bracket = "("
  static let spacingBracket = "\n("
  
  static let orientation = "orientation"
}

final class MainViewController: UIViewController {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var posterImageView: UIImageView!
  @IBOutlet private weak var visitorsLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.parse()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
    self.lockOrientation(.portrait, andRotateTo: .portrait)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
    self.lockOrientation(.all)
  }
}

// MARK: - Private Extension

private extension MainViewController {
  
  func parse() {
    let parsedResult = Expo.parseJSON(with: AssetName.expo)
    switch parsedResult {
    case let .success(expo):
      self.setUpView(from: expo)
    case let .failure(error):
      self.showAlertController(
        title: Constants.notice,
        message: error.localizedDescription,
        preferredStyle: .alert,
        actions: [UIAlertAction(title: Constants.confirm, style: .default)]
      )
    }
  }
  
  func showAlertController(
    title: String?,
    message: String?,
    preferredStyle: UIAlertController.Style,
    actions: [UIAlertAction]
  ) {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: preferredStyle
    )
    actions.forEach { action in
      alertController.addAction(action)
    }
    self.present(alertController, animated: true)
  }
  
  func setUpView(from expo: Expo) {
    self.titleLabel.text = expo.title.replacingOccurrences(
      of: Constants.bracket,
      with: Constants.spacingBracket
    )
    self.posterImageView.image = UIImage(named: AssetName.poster)
    self.visitorsLabel.text = String(format: Constants.visitor, expo.visitors.toDecimal())
    self.locationLabel.text = Constants.location + expo.location
    self.durationLabel.text = Constants.duration + expo.duration
    self.descriptionLabel.text = expo.description
  }
}

// MARK: - Orientation Extension

private extension MainViewController {
  
  func lockOrientation(
    _ orientation: UIInterfaceOrientationMask
  ) {
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
      delegate.setOrientationLock(orientation)
    }
  }
  
  func lockOrientation(
    _ orientation: UIInterfaceOrientationMask,
    andRotateTo rotateOrientation:UIInterfaceOrientation
  ) {
    self.lockOrientation(orientation)
    UIDevice.current.setValue(rotateOrientation.rawValue, forKey: Constants.orientation)
  }
}
