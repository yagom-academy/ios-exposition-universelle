//
//  HeritageDetailView.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/19.
//

import UIKit

//MARK: - Const

extension HeritageDetailView {
  private enum Const {
    enum Image {
      static let ratio: CGFloat = 0.3
    }
    enum Stack {
      static let margin: CGFloat = 10
      static let spacing: CGFloat = 10
    }
  }
}

//MARK: - View

final class HeritageDetailView: UIView {
  
  private lazy var baseScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  private lazy var baseStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = Const.Stack.spacing
    return stackView
  }()
  
  lazy var heritageImageView: UIImageView = {
    let imageView = UIImageView()
    let width = Const.Image.ratio * self.bounds.width
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.numberOfLines = .zero
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubViews()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//MARK: - Layout

extension HeritageDetailView {
  
  private func addSubViews() {
    addSubviews(baseScrollView)
    baseScrollView.addSubviews(baseStackView)
    baseStackView.addArrangedSubviews(heritageImageView, descriptionLabel)
  }
  
  private func layout() {
    //MARK: - baseScrollView
    
    NSLayoutConstraint.activate([
      baseScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      baseScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      baseScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      baseScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
    ])
    
    //MARK: - baseStackView
    
    baseStackView.directionalLayoutMargins = .init(top: Const.Stack.margin, leading: Const.Stack.margin, bottom: Const.Stack.margin, trailing: Const.Stack.margin)
    baseStackView.isLayoutMarginsRelativeArrangement = true
    
    NSLayoutConstraint.activate([
      baseStackView.topAnchor.constraint(equalTo: baseScrollView.topAnchor),
      baseStackView.bottomAnchor.constraint(equalTo: baseScrollView.bottomAnchor),
      baseStackView.leadingAnchor.constraint(equalTo: baseScrollView.leadingAnchor),
      baseStackView.trailingAnchor.constraint(equalTo: baseScrollView.trailingAnchor),
      baseStackView.widthAnchor.constraint(equalTo: baseScrollView.widthAnchor)
    ])
  }
}
