//
//  Expo1900 - ExpoViewController.swift
//  Created by Taeangel, dudu on 2022/04/11.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = .preferredFont(forTextStyle: .title1)
    return label
  }()
  
  private let imageView: UIImageView = {
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
  
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("한국의 출품작 보러가기", for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    layout()
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
    guard let (expo, poster) = prepareData() else {
      return
    }
    
    titleLabel.text = expo.title
    imageView.image = poster
    visitorLabel.text = "\(expo.visitors ?? 0)"
    locationLabel.text = expo.location
    durationLabel.text = expo.duration
    descriptionLabel.text = expo.description
    button.addTarget(self, action: #selector(didTapKoreaHeritageButton(_:)), for: .touchUpInside)
  }
  
  @objc private func didTapKoreaHeritageButton(_ sender: UIButton) {
    
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

//MARK: - Layout

extension ExpoViewController {
  private func layout() {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)

    scrollView.leadingAnchor.constraint(
      equalTo: view.leadingAnchor
    ).isActive = true
    scrollView.trailingAnchor.constraint(
      equalTo: view.trailingAnchor
    ).isActive = true
    scrollView.topAnchor.constraint(
      equalTo: view.topAnchor
    ).isActive = true
    scrollView.bottomAnchor.constraint(
      equalTo: view.bottomAnchor
    ).isActive = true
    
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 10
    
    scrollView.addSubview(stackView)
    stackView.leadingAnchor.constraint(
      equalTo: scrollView.leadingAnchor
    ).isActive = true
    stackView.trailingAnchor.constraint(
      equalTo: scrollView.trailingAnchor
    ).isActive = true
    stackView.topAnchor.constraint(
      equalTo: scrollView.topAnchor
    ).isActive = true
    stackView.bottomAnchor.constraint(
      equalTo: scrollView.bottomAnchor
    ).isActive = true
    stackView.widthAnchor.constraint(
      equalTo: scrollView.widthAnchor
    ).isActive = true

    let buttonStackView = UIStackView()
    buttonStackView.distribution = .equalCentering
    
    let flagimageVoew = UIImageView(image: UIImage(named: "flag"))
    
    buttonStackView.addArrangedSubview(flagimageVoew)
    buttonStackView.addArrangedSubview(buttonStackView)
    buttonStackView.addArrangedSubview(flagimageVoew)

    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(visitorLabel)
    stackView.addArrangedSubview(locationLabel)
    stackView.addArrangedSubview(durationLabel)
    stackView.addArrangedSubview(descriptionLabel)
    stackView.addArrangedSubview(buttonStackView)
  }
}
