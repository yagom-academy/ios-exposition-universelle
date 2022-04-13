//
//  Expo1900 - ExpoViewController.swift
//  Created by Taeangel, dudu on 2022/04/11.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ExpoViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    layout()
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
  }
  
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
    
    let titleLabel = UILabel()
    titleLabel.numberOfLines = 2
    titleLabel.font = .preferredFont(forTextStyle: .title1)
    
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    
    let visitorLabel = UILabel()
    let locationLabel = UILabel()
    let durationLabel = UILabel()
    let descriptionLabel = UILabel()
    descriptionLabel.numberOfLines = 0
    
    let buttonStackView = UIStackView()
    buttonStackView.distribution = .equalCentering
    
    let button = UIButton()
    button.setTitle("한국의 출품작 보러가기", for: .normal)
    
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

