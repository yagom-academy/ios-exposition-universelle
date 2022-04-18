//
//  HeritageDetailViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

//MARK: - Const

extension HeritageDetailViewController {
  private enum Const {
    enum Image {
      static let defaultName = "swift"
    }
  }
}

//MARK: - ViewController

final class HeritageDetailViewController: UIViewController {
  
  private lazy var baseView = HeritageDetailView(frame: view.bounds)
  private let heritage: Heritage
  
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
    baseView.heritageImageView.image = UIImage(named: heritage.imageName ?? Const.Image.defaultName)
  }
}
