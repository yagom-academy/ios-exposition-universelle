//
//  Expo1900 - ExpoViewController.swift
//  Created by Taeangel, dudu on 2022/04/11.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

//MARK: - Const

fileprivate enum Const {
  enum Literal {
    static let personFormat = " 명"
    static let leftParenthesis: Character = "("
    static let lindFeed = "\n"
  }
  
  enum Image {
    static let name = "poster"
  }
  
  enum File {
    static let name = "exposition_universelle_1900"
  }
  
  enum Navigation {
    static let backButton = "메인"
  }
}

//MARK: - Private Extension

private extension Int {
  
  func decimalStyleFormat() -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    guard let formattedNumber = numberFormatter.string(for: self) else {
      return "0"
    }
    return formattedNumber
  }
}

private extension String {
  
  func add(text: String) -> String? {
    return self + text
  }

  func divideLine(with target: Character) -> String? {
    return self.split(separator: target).joined(separator: "\(Const.Literal.lindFeed)\(target)")
  }
}

//MARK: - ViewController

final class ExpoViewController: UIViewController {
  
  private lazy var baseView = ExpoView(frame: view.bounds)
  private var expo: Expo? {
    didSet {
      DispatchQueue.main.async {
        self.bind()
        self.baseView.layoutIfNeeded()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    requestData()
  }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
    
    let value = UIDeviceOrientation.portrait.rawValue
    UIDevice.current.setValue(value, forKey: "orientation")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = false
  }
  
  private func attribute() {
    view = baseView
    navigationItem.backButtonTitle = Const.Navigation.backButton
  }
  
  private func requestData() {
    Expo.parse(name: Const.File.name) { result in
      switch result {
      case .success(let data):
        expo = data
      case .failure(let error):
        print(error)
      }
    }
  }
  
  private func bind() {
    baseView.titleLabel.text = expo?.title?.divideLine(with: Const.Literal.leftParenthesis)
    baseView.posterImageView.image = UIImage(named: Const.Image.name)
    baseView.visitorValueLabel.text = expo?.visitors?.decimalStyleFormat()?.add(text: Const.Literal.personFormat)
    baseView.locationValueLabel.text = expo?.location
    baseView.durationValueLabel.text = expo?.duration
    baseView.descriptionLabel.text = expo?.description
    
    baseView.koreaHeritageButton.addTarget(
      self,
      action: #selector(didTapKoreaHeritageButton(_:)),
      for: .touchUpInside
    )
  }
  
  @objc private func didTapKoreaHeritageButton(_ sender: UIButton) {
    let heritageViewController = HeritageViewController()
    navigationController?.pushViewController(heritageViewController, animated: true)
  }
}
