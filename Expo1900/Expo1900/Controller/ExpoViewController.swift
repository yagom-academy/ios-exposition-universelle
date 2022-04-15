//
//  Expo1900 - ExpoViewController.swift
//  Created by Taeangel, dudu on 2022/04/11.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

private extension Int {
  
  func addComma() -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    guard let formattedNumber = numberFormatter.string(for: self) else {
      return "0 명"
    }
    
    return formattedNumber + " 명"
  }
}

private extension String {
  
  func changeFontSize(insert title: String) -> NSAttributedString? {
    let colonText = ": " + self
    let targetText = title + " " + colonText
    let attributedString = NSMutableAttributedString(string: targetText)
    attributedString.addAttribute(
      .font,
      value: UIFont.preferredFont(forTextStyle: .title2),
      range: (targetText as NSString).range(of: title)
    )
    
    return attributedString
  }
}

final class ExpoViewController: UIViewController {
  
  private lazy var baseView = ExpoView(frame: view.bounds)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    bind()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = false
  }
  
  private func attribute() {
    navigationItem.backButtonTitle = "메인"
    view.backgroundColor = .systemBackground
  }
  
  private func bind() {
    view = baseView
    guard let (expo, poster) = prepareData() else {
      return
    }
    
    guard var expoTitle = expo.title, let targetIndex = expoTitle.firstIndex(of: "(") else {
      return
    }
    
    expoTitle.insert("\n", at: targetIndex)
    
    baseView.titleLabel.text = expoTitle
    baseView.posterImageView.image = poster
    baseView.visitorLabel.text = expo.visitors?.addComma()
    baseView.locationLabel.text = expo.location
    baseView.durationLabel.text = expo.duration
    baseView.descriptionLabel.text = expo.description
    
    baseView.visitorLabel.attributedText = baseView.visitorLabel.text?.changeFontSize(insert: "방문객")
    baseView.locationLabel.attributedText = baseView.locationLabel.text?.changeFontSize(insert: "개최지")
    baseView.durationLabel.attributedText = baseView.durationLabel.text?.changeFontSize(insert: "개최 기간")
    
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

  private func prepareData() -> (Expo, UIImage)? {
    guard let expo = ParseManager<Expo>.parse(name: "exposition_universelle_1900") else {
      return nil
    }
    guard let poster = UIImage(named: "poster") else {
      return nil
    }
    
    return (expo, poster)
  }
}
