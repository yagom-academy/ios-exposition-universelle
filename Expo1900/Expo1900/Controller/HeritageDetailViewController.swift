//
//  HeritageDetailViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

final class HeritageDetailViewController: UIViewController {
  
  private let heritage: Heritage
  private lazy var baseView = HeritageDetailView(frame: view.bounds)
  
  init(heritage: Heritage) {
    self.heritage = heritage
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    bind()
  }
  
  private func attribute() {
    view = baseView
    view.backgroundColor = .systemBackground
  }
  
  private func bind() {
    title = heritage.name
    baseView.descriptionLabel.text = heritage.description
    baseView.heritageImageView.image = UIImage(named: heritage.imageName ?? "swift")
  }
}
