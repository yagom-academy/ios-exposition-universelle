//
//  ExpoView.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/15.
//

import UIKit

class ExpoView: UIView {
  private enum Const {
    enum Image {
      static let width: CGFloat = 40
      static let height: CGFloat = 40
      static let name: String = "flag"
    }
    enum Scroll {
      static let top: CGFloat = 15
      static let bottom: CGFloat = -15
      static let leading: CGFloat = 15
      static let trailing: CGFloat = -15
    }
    
    enum Stack {
      static let top: CGFloat = 10
      static let bottom: CGFloat = -10
      static let leading: CGFloat = 10
      static let trailing: CGFloat = -10
      static let spacing: CGFloat = 10
    }
    
    enum ButtonStack {
      static let spacing: CGFloat = 30
    }
    
    enum Button {
      static let title: String = "한국의 출품작 보러가기"
    }
  }
  
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
    label.numberOfLines = 2
    label.textAlignment = .center
    label.font = .preferredFont(forTextStyle: .title1)
    return label
  }()
  
  lazy var posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  lazy var visitorStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  lazy var visitorLabel : UILabel = {
    let label = UILabel()
    label.text = "방문객 : "
    label.font = .preferredFont(forTextStyle: .title2)
    return label
  }()
  
  lazy var visitorValueLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var locationStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  lazy var locationLabel : UILabel = {
    let label = UILabel()
    label.text = "개최지 : "
    label.font = .preferredFont(forTextStyle: .title2)
    return label
  }()
  
  lazy var locationValueLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var durationStackView: UIStackView = {
    let stackView = UIStackView()
    return stackView
  }()
  
  lazy var durationLabel : UILabel = {
    let label = UILabel()
    label.text = "개최 기간 : "
    label.font = .preferredFont(forTextStyle: .title2)
    return label
  }()
  
  lazy var durationValueLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
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
    setUp()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
 
  private func setUp() {
    backgroundColor = .systemBackground
    
    addSubview(baseScrollView)
    baseScrollView.addSubview(baseStackView)
    
    visitorStackView.addArrangedSubview(visitorLabel)
    visitorStackView.addArrangedSubview(visitorValueLabel)
    
    locationStackView.addArrangedSubview(locationLabel)
    locationStackView.addArrangedSubview(locationValueLabel)
    
    durationStackView.addArrangedSubview(durationLabel)
    durationStackView.addArrangedSubview(durationValueLabel)
  
    buttonStackView.addArrangedSubview(leftFlagImageView)
    buttonStackView.addArrangedSubview(koreaHeritageButton)
    buttonStackView.addArrangedSubview(rightFlagImageView)

    baseStackView.addArrangedSubview(titleLabel)
    baseStackView.addArrangedSubview(posterImageView)
    baseStackView.addArrangedSubview(visitorStackView)
    baseStackView.addArrangedSubview(locationStackView)
    baseStackView.addArrangedSubview(durationStackView)
    baseStackView.addArrangedSubview(descriptionLabel)
    baseStackView.addArrangedSubview(buttonStackView)
  }
  
  private func layout() {
    
    //MARK: - baseScrollView
    
    NSLayoutConstraint.activate([
      baseScrollView.topAnchor.constraint(
        equalTo: self.topAnchor,
        constant: Const.Scroll.top
      ),
      baseScrollView.bottomAnchor.constraint(
        equalTo: self.bottomAnchor,
        constant: Const.Scroll.bottom
      ),
      baseScrollView.leadingAnchor.constraint(
        equalTo: self.leadingAnchor,
        constant: Const.Scroll.leading
      ),
      baseScrollView.trailingAnchor.constraint(
        equalTo: self.trailingAnchor,
        constant: Const.Scroll.trailing
      )
    ])
    
    //MARK: - baseStackView
    
    NSLayoutConstraint.activate([
      baseStackView.leadingAnchor.constraint(equalTo: baseScrollView.leadingAnchor),
      baseStackView.trailingAnchor.constraint(equalTo: baseScrollView.trailingAnchor),
      baseStackView.topAnchor.constraint(equalTo: baseScrollView.topAnchor),
      baseStackView.bottomAnchor.constraint(equalTo: baseScrollView.bottomAnchor),
      baseStackView.widthAnchor.constraint(equalTo: baseScrollView.widthAnchor)
    ])
  }
}
