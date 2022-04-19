//
//  Expo1900 - MainViewController.swift
//  Created by Lingo, Mino
// 

import UIKit

fileprivate extension Constants {
  static let notice = "알림"
  static let confirm = "확인"
  static let visitor = "방문객 : %@ 명"
  static let visitorPrefix = "방문객"
  static let location = "개최지 : "
  static let locationPrefix = "개최지"
  static let duration = "개최 기간 : "
  static let durationPrefix = "개최 기간"
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
    self.setAttributed(
      of: String(format: Constants.visitor, expo.visitors.toDecimal()),
      with: Constants.visitorPrefix,
      in: self.visitorsLabel
    )
    self.setAttributed(
      of: Constants.location + expo.location,
      with: Constants.locationPrefix,
      in: self.locationLabel
    )
    self.setAttributed(
      of: Constants.duration + expo.duration,
      with: Constants.durationPrefix,
      in: self.durationLabel
    )
    self.descriptionLabel.text = expo.description
  }
  
  func setAttributed(of text: String, with targetString: String, in label: UILabel) {
    let font = UIFont.preferredFont(forTextStyle: .title3)
    let range = (text as NSString).range(of: targetString)
    let attributedString = NSMutableAttributedString(string: text)
    attributedString.addAttribute(.font, value: font, range: range)
    label.attributedText = attributedString
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
