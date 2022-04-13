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

