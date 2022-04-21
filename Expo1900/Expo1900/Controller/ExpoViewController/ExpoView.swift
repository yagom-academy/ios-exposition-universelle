//
//  ExpoView.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/15.
//

import UIKit

//MARK: - Const

extension ExpoView {
  
  private enum Const {
    enum Image {
      static let width: CGFloat = 40
      static let height: CGFloat = 40
      static let name: String = "flag"
    }
    enum Scroll {
      static let top: CGFloat = 15
      static let bottom: CGFloat = -15
    }
    
    enum Stack {
      static let top: CGFloat = 10
      static let bottom: CGFloat = -10
      static let leading: CGFloat = 10
      static let trailing: CGFloat = -10
      static let spacing: CGFloat = 10
      static let margin: CGFloat = 10
    }
    
    enum ButtonStack {
      static let spacing: CGFloat = 30
    }
    
    enum Button {
      static let title: String = "한국의 출품작 보러가기"
    }
    
    enum Literal {
      static let visitor = "방문객 : "
      static let location = "개최지 : "
      static let duration = "개최 기간 : "
    }
  }
}

//MARK: - View

final class ExpoView: UIView {
  
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
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .title1)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.numberOfLines = 2
    label.textAlignment = .center
    return label
  }()
  
  lazy var posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private lazy var visitorStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  lazy var visitorLabel : UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .title2)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.text = Const.Literal.visitor
    return label
  }()
  
  lazy var visitorValueLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()
  
  private lazy var locationStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  lazy var locationLabel : UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .title2)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.text = Const.Literal.location
    return label
  }()
  
  lazy var locationValueLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()
  
  private lazy var durationStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  lazy var durationLabel : UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .title2)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.text = Const.Literal.duration
    return label
  }()
  
  lazy var durationValueLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .body)
    label.adjustsFontForContentSizeCategory = true
    label.numberOfLines = .zero
    return label
  }()
  
  private lazy var buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fill
    stackView.spacing = Const.ButtonStack.spacing
    return stackView
  }()
  
  lazy var koreaHeritageButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitle(Const.Button.title, for: .normal)
    button.titleLabel?.adjustsFontForContentSizeCategory = true
    button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
    return button
  }()
  
  private lazy var leftFlagImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: Const.Image.name))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: Const.Image.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: Const.Image.height).isActive = true
    return imageView
  }()
  
  private lazy var rightFlagImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: Const.Image.name))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: Const.Image.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: Const.Image.height).isActive = true
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    attribute()
    addSubViews()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func attribute() {
    backgroundColor = .systemBackground
  }
}

//MARK: - Layout

extension ExpoView {
  
  private func addSubViews() {
    addSubview(baseScrollView)
    baseScrollView.addSubview(baseStackView)
    
    visitorStackView.addArrangedSubviews(visitorLabel, visitorValueLabel)
    locationStackView.addArrangedSubviews(locationLabel, locationValueLabel)
    durationStackView.addArrangedSubviews(durationLabel, durationValueLabel)
    buttonStackView.addArrangedSubviews(leftFlagImageView, koreaHeritageButton, rightFlagImageView)
    baseStackView.addArrangedSubviews(titleLabel, posterImageView, visitorStackView, locationStackView, durationStackView, descriptionLabel, buttonStackView)
  }
  
  private func layout() {
    
    //MARK: - baseScrollView
    
    NSLayoutConstraint.activate([
      baseScrollView.topAnchor.constraint(equalTo: topAnchor, constant: Const.Scroll.top),
      baseScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Const.Scroll.bottom),
      baseScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      baseScrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
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
