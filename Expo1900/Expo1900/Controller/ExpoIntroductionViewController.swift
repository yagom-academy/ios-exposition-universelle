//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoIntroductionViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var expoPoster: UIImageView!
  @IBOutlet weak var numberOfVisitorsLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var durationLabel: UILabel!
  @IBOutlet weak var descriptionTextView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let decodedResult = CustomJSONDecoder.decode(to: ExpoIntroduction.self, from: "exposition_universelle_1900")
    
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
  private func updateUI(from data: ExpoIntroduction) {
    titleLabel.text = data.title
    expoPoster.image = UIImage(named: "poster")
    locationLabel.text = ExpoIntroductionAffix.locationPrefix.rawValue + data.location
    durationLabel.text = ExpoIntroductionAffix.durationPrefix.rawValue + data.duration
    descriptionTextView.text = data.description
    
    switch formatNumber(of: data.visitors) {
    case .success(let formattedNumber):
      numberOfVisitorsLabel.text = ExpoIntroductionAffix.visitorPrefix.rawValue + formattedNumber
        + ExpoIntroductionAffix.visitorSuffix.rawValue
    case .failure(ExpoAppError.numberFormattingFailed(let number)):
      debugPrint(ExpoAppError.numberFormattingFailed(number))
    case .failure(_):
      debugPrint(ExpoAppError.unknownError(#function))
    }
  }
  
  private func formatNumber(of number: Int) -> Result<String, ExpoAppError> {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    
    guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) else {
      return .failure(ExpoAppError.numberFormattingFailed(number))
    }
    
    return .success(formattedNumber)
  }
}
