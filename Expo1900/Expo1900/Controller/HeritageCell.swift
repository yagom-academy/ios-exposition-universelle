//
//  HeritageCell.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

extension UITableViewCell {

  static var identifier: String {
    return String(describing: self)
  }
}

class HeritageCell: UITableViewCell {
 
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layout()
    attribute()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .title1)
    return label
  }()
  
  private let descriptionLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()
  
  private let heritageImageView: UIImageView = {
    let imgView = UIImageView()
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    return imgView
  }()
  
  func update(with item: Heritage) {
    titleLabel.text = item.name
    descriptionLabel.text = item.shortDescription
    heritageImageView.image = UIImage(named: item.imageName ?? "swift")
  }
  
  private func attribute() {
    accessoryType = .disclosureIndicator
  }
}

//MARK: - Layout

extension HeritageCell {
  
  private func layout() {
    let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    contentView.addSubview(stackView)
    contentView.addSubview(heritageImageView)
    
    let heritageImageWidth: CGFloat = 60
    let heritageHeightWidth: CGFloat = 60
    let heritageHorizontalMargin: CGFloat = 10
    
    heritageImageView.widthAnchor.constraint(
      equalToConstant: heritageImageWidth
    ).isActive = true
    heritageImageView.heightAnchor.constraint(
      equalToConstant: heritageHeightWidth
    ).isActive = true
    heritageImageView.leadingAnchor.constraint(
      equalTo: contentView.leadingAnchor,
      constant: heritageHorizontalMargin
    ).isActive = true
    heritageImageView.trailingAnchor.constraint(
      equalTo: stackView.leadingAnchor,
      constant: -heritageHorizontalMargin
    ).isActive = true
    heritageImageView.centerYAnchor.constraint(
      equalTo: contentView.centerYAnchor
    ).isActive = true
    
    let stackViewVerticalMargin: CGFloat = 15
    
    stackView.trailingAnchor.constraint(
      equalTo: contentView.trailingAnchor,
      constant: -10
    ).isActive = true
    stackView.topAnchor.constraint(
      equalTo: contentView.topAnchor,
      constant: stackViewVerticalMargin
    ).isActive = true
    stackView.bottomAnchor.constraint(
      equalTo: contentView.bottomAnchor,
      constant: -stackViewVerticalMargin
    ).isActive = true
  }
}
