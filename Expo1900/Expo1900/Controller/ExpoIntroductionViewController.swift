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

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and update UI
    
    let decodedResult: Result = ExpoJSONDecoder.decode(
      to: ExpoIntroduction.self,
      from: "exposition_universelle_1900"
    )
    
    switch decodedResult {
    case .success(let expoIntroduction):
      updateUI(from: expoIntroduction)
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
    switch formatNumber(of: data.visitors) {
    case .success(let formattedNumber):
      numberOfVisitorsLabel.text = ExpoIntroductionAffix.Prefix.visitor.rawValue + formattedNumber +
        ExpoIntroductionAffix.Suffix.visitorSuffix.rawValue
    case .failure(ExpoAppError.numberFormattingFailed(let number)):
      debugPrint(ExpoAppError.numberFormattingFailed(number))
    case .failure(_):
      debugPrint(ExpoAppError.unknownError(#function))
    }
  }
  
  private func updateUI(from data: ExpoIntroduction) {
    titleLabel.text = data.title
    expoPosterImageView.image = UIImage(named: "poster")
    locationLabel.text = ExpoIntroductionAffix.Prefix.location.rawValue + data.location
    durationLabel.text = ExpoIntroductionAffix.Prefix.duration.rawValue + data.duration
    descriptionTextView.text = data.description
    
    updateNumberOfVisitorsLabel(from: data)
  }
  
  func formatNumber(of number: Int) -> Result<String, ExpoAppError> {
    let numberFormatter: NumberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    
    guard let formattedNumber: String = numberFormatter.string(from: NSNumber(value: number)) else {
      return .failure(ExpoAppError.numberFormattingFailed(number))
    }
    
    return .success(formattedNumber)
  }
}
