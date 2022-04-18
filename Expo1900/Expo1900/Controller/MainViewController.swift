//
//  Expo1900 - MainViewController.swift
//  Created by Lingo, Mino
// 

import UIKit

fileprivate extension Const {
  static let visitor = "방문객 : "
  static let personUnit = " 명"
  static let location = "개최지 : "
  static let duration = "개최 기간 : "
  static let bracket = "("
  static let spacingBracket = "\n("
}

final class MainViewController: UIViewController, AlertPresentable {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var posterImageView: UIImageView!
  @IBOutlet private weak var visitorsLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  lazy var alertBuilder: AlertBuilderable = AlertBuilder(viewController: self)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.parse()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
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
      alertBuilder
        .setTitle(error.localizedDescription)
        .setConfirmTitle(Const.confirm)
        .showAlert()
    }
  }
  
  func setUpView(from expo: Expo) {
    self.titleLabel.text = expo.title.replacingOccurrences(
      of: Const.bracket,
      with: Const.spacingBracket
    )
    self.posterImageView.image = UIImage(named: AssetName.poster)
    self.visitorsLabel.text = Const.visitor + expo.visitors.toDecimal() + Const.personUnit
    self.locationLabel.text = Const.location + expo.location
    self.durationLabel.text = Const.duration + expo.duration
    self.descriptionLabel.text = expo.description
  }
}
