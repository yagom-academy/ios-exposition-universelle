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
    enum Prefix {
      static let visitor: String = "방문객: "
      static let location: String = "개최지: "
      static let duration: String = "개최 기간: "
    }
    
    enum Suffix {
      static let visitorSuffix: String = " 명"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and insert to the UI elements
    
    let decodedResult: Result = ExpoJSONDecoder.decode(
      to: ExpoIntroduction.self,
      from: ExpoData.expoIntroduction
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

// MARK: - Methods for inserting data to the UI elements

extension ExpoIntroductionViewController {
  private func insertDataToNumberOfVisitorsLabel(from data: ExpoIntroduction) {
    switch formattedNumber(data.visitors) {
    case .success(let formattedNumber):
      numberOfVisitorsLabel.text = Affix.Prefix.visitor + formattedNumber +
        Affix.Suffix.visitorSuffix
    case .failure(ExpoAppError.numberFormattingFailed(let number)):
      debugPrint(ExpoAppError.numberFormattingFailed(number))
    case .failure(_):
      debugPrint(ExpoAppError.unknownError(#function))
    }
  }
  
  private func insertDataToUI(from data: ExpoIntroduction) {
    titleLabel.text = data.title
    expoPosterImageView.image = UIImage(named: "poster")
    locationLabel.text = Affix.Prefix.location + data.location
    durationLabel.text = Affix.Prefix.duration + data.duration
    descriptionTextView.text = data.description
    
    insertDataToNumberOfVisitorsLabel(from: data)
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
