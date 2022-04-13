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
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.textAlignment = .center
    label.font = .preferredFont(forTextStyle: .title1)
    return label
  }()
  
  private let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let visitorLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  private let locationLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  private let durationLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()
  
  private let koreaHeritageButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitle("한국의 출품작 보러가기", for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    layout()
  }
  
  private func attribute() {
    navigationController?.navigationBar.isHidden = true
    navigationItem.backButtonTitle = "메인"
    view.backgroundColor = .systemBackground
    
    guard let (expo, poster) = prepareData() else {
      return
    }
    
    guard var expoTitle = expo.title, let targetIndex = expoTitle.firstIndex(of: "(") else {
      return
    }
    
    expoTitle.insert("\n", at: targetIndex)
    
    titleLabel.text = expoTitle
    posterImageView.image = poster
    visitorLabel.text = expo.visitors?.addComma()
    locationLabel.text = expo.location
    durationLabel.text = expo.duration
    descriptionLabel.text = expo.description
    
    visitorLabel.attributedText = visitorLabel.text?.changeFontSize(insert: "방문객")
    locationLabel.attributedText = locationLabel.text?.changeFontSize(insert: "개최지")
    durationLabel.attributedText = durationLabel.text?.changeFontSize(insert: "개최 기간")
    
    koreaHeritageButton.addTarget(
      self,
      action: #selector(didTapKoreaHeritageButton(_:)),
      for: .touchUpInside
    )
  }
  
  @objc private func didTapKoreaHeritageButton(_ sender: UIButton) {}

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

//MARK: - Layout

extension ExpoViewController {
  
  private func layout() {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)

    scrollView.leadingAnchor.constraint(
      equalTo: view.leadingAnchor,
      constant: 15
    ).isActive = true
    scrollView.trailingAnchor.constraint(
      equalTo: view.trailingAnchor,
      constant: -15
    ).isActive = true
    scrollView.topAnchor.constraint(
      equalTo: view.topAnchor,
      constant: 20
    ).isActive = true
    scrollView.bottomAnchor.constraint(
      equalTo: view.bottomAnchor,
      constant: -20
    ).isActive = true
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 10
    
    scrollView.addSubview(stackView)
    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

    let buttonStackView = UIStackView()
    buttonStackView.distribution = .fill
    buttonStackView.spacing = 30
    
    let leftFlagImageView = UIImageView(image: UIImage(named: "flag"))
    leftFlagImageView.translatesAutoresizingMaskIntoConstraints = false
    leftFlagImageView.contentMode = .scaleAspectFit
    leftFlagImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    leftFlagImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    let rightFlagImageView = UIImageView(image: UIImage(named: "flag"))
    rightFlagImageView.translatesAutoresizingMaskIntoConstraints = false
    rightFlagImageView.contentMode = .scaleAspectFit
    rightFlagImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    rightFlagImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

    buttonStackView.addArrangedSubview(leftFlagImageView)
    buttonStackView.addArrangedSubview(koreaHeritageButton)
    buttonStackView.addArrangedSubview(rightFlagImageView)

    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(posterImageView)
    stackView.addArrangedSubview(visitorLabel)
    stackView.addArrangedSubview(locationLabel)
    stackView.addArrangedSubview(durationLabel)
    stackView.addArrangedSubview(descriptionLabel)
    stackView.addArrangedSubview(buttonStackView)
  }
}
