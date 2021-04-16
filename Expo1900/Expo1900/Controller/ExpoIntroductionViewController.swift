//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoIntroductionViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var expoPosterImageView: UIImageView!
  @IBOutlet private weak var numberOfVisitorsLabel: UILabel!
  @IBOutlet private weak var locationLabel: UILabel!
  @IBOutlet private weak var durationLabel: UILabel!
  @IBOutlet private weak var descriptionTextView: UITextView!
  override var shouldAutorotate: Bool { return false }
  override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation { return .portrait }
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }
  private let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  // MARK: - Namespace
  private enum Affix {
    enum Prefix {
      static let visitor: String = "방문객: "
      static let location: String = "개최지: "
      static let duration: String = "개최 기간: "
    }
    
    enum Suffix {
      static let visitor: String = " 명"
    }
  }

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let decodedResult: Result = ExpoJSONDecoder.decode(
      to: ExpoIntroduction.self,
      from: ExpoData.expoIntroduction
    )
    
    switch decodedResult {
    case .success(let expoIntroduction):
      configureUI(with: expoIntroduction)
    case .failure(let error):
      debugPrint(error)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    appDelegate.shouldSupportAllOrientation = false
    self.navigationController?.isNavigationBarHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    appDelegate.shouldSupportAllOrientation = true
    self.navigationController?.isNavigationBarHidden = false
  }
}

// MARK: - Methods for configuring the UI elements
extension ExpoIntroductionViewController {
  private func configureNumberOfVisitorsLabel(with data: ExpoIntroduction) {
    switch formattedNumber(data.visitors) {
    case .success(let formattedNumber):
      numberOfVisitorsLabel.text = Affix.Prefix.visitor + formattedNumber +
        Affix.Suffix.visitor
    case .failure(ExpoAppError.numberFormattingFailed(let number)):
      debugPrint(ExpoAppError.numberFormattingFailed(number))
    case .failure(_):
      debugPrint(ExpoAppError.unknownError(#function))
    }
  }
  
  private func configureTitleLabel(with data: ExpoIntroduction) {
    titleLabel.text = data.title
    
    let newLineTargetString = titleLabel.text?.range(of: "1900")
    
    titleLabel.text = titleLabel.text?.replacingOccurrences(
      of: "1900",
      with: "1900\n",
      range: newLineTargetString
    )
  }
  
  private func configureUI(with data: ExpoIntroduction) {
    expoPosterImageView.image = UIImage(named: "poster")
    locationLabel.text = Affix.Prefix.location + data.location
    durationLabel.text = Affix.Prefix.duration + data.duration
    descriptionTextView.text = data.description
    
    configureTitleLabel(with: data)
    configureNumberOfVisitorsLabel(with: data)
  }
  
  func formattedNumber(_ number: Int) -> Result<String, ExpoAppError> {
    let numberFormatter: NumberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    
    guard let formatted: String = numberFormatter.string(from: NSNumber(value: number)) else {
      return .failure(ExpoAppError.numberFormattingFailed(number))
    }
    
    return .success(formatted)
  }
}
