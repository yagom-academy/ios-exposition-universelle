//
//  HeritageDetailViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

final class HeritageDetailViewController: UIViewController {
  
  private let heritage: Heritage
  
  private lazy var heritageImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: heritage.imageName ?? "swift")
    return imageView
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = heritage.description
    label.font = .preferredFont(forTextStyle: .body)
    label.numberOfLines = 0
    return label
  }()
 
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
    layout()
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
    title = heritage.name
  }
}

//MARK: - Layout

extension HeritageDetailViewController {
  private func layout() {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(scrollView)
    
    let scrollViewHorizontalMargin: CGFloat = 15
    
    scrollView.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor
    ).isActive = true
    scrollView.bottomAnchor.constraint(
      equalTo: view.bottomAnchor
    ).isActive = true
    scrollView.trailingAnchor.constraint(
      equalTo: view.trailingAnchor,
      constant: -scrollViewHorizontalMargin
    ).isActive = true
    scrollView.leadingAnchor.constraint(
      equalTo: view.leadingAnchor,
      constant: scrollViewHorizontalMargin
    ).isActive = true
    
    let stackView = UIStackView(arrangedSubviews: [heritageImageView, descriptionLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    scrollView.addSubview(stackView)
    
    stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
  }
}
