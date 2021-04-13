//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoIntroductionViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var expoPosterImageView: UIImageView!
  @IBOutlet weak var numberOfVisitorsLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!
  
  private enum Affix {
    enum Prefix: String {
      case visitor = "방문객: "
      case location = "개최지: "
      case duration = "개최 기간: "
    }
    
    enum Suffix: String {
      case visitorSuffix = " 명"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and update UI
    
    let decodedResult: Result = ExpoJSONDecoder.decode(
      to: ExpoIntroduction.self,
      from: ExpoData.expoIntroduction.rawValue
    )
    
    switch decodedResult {
    case .success(let expoIntroduction):
      insertDataToUI(from: expoIntroduction)
    case .failure(let error):
      debugPrint(error)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
  }
}

extension ExpoIntroductionViewController {
  
  // MARK: - Methods for updating the UI
  
  private func updateNumberOfVisitorsLabel(from data: ExpoIntroduction) {
    switch formattedNumber(data.visitors) {
    case .success(let formattedNumber):
      numberOfVisitorsLabel.text = Affix.Prefix.visitor.rawValue + formattedNumber +
        Affix.Suffix.visitorSuffix.rawValue
    case .failure(ExpoAppError.numberFormattingFailed(let number)):
      debugPrint(ExpoAppError.numberFormattingFailed(number))
    case .failure(_):
      debugPrint(ExpoAppError.unknownError(#function))
    }
  }
  
  private func insertDataToUI(from data: ExpoIntroduction) {
    titleLabel.text = data.title
    expoPosterImageView.image = UIImage(named: "poster")
    locationLabel.text = Affix.Prefix.location.rawValue + data.location
    durationLabel.text = Affix.Prefix.duration.rawValue + data.duration
    descriptionTextView.text = data.description
    
    updateNumberOfVisitorsLabel(from: data)
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
