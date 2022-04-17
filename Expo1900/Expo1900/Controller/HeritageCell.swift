//
//  HeritageCell.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

//MARK: - UITableViewCell Extension

extension UITableViewCell {

  static var identifier: String {
    return String(describing: self)
  }
}

//MARK: - Const

extension HeritageCell {
  private enum Const {
    enum Image {
      static let leading: CGFloat = 10
      static let trailing: CGFloat = -10
      static let width: CGFloat = 60
      static let height: CGFloat = 60
    }
    enum StackView {
      static let top: CGFloat = 15
      static let bottom: CGFloat = -15
      static let trailing: CGFloat = -10
    }
  }
}

//MARK: TableViewCell

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
  
    NSLayoutConstraint.activate([
      heritageImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.Image.leading),
      heritageImageView.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: Const.Image.trailing),
      heritageImageView.widthAnchor.constraint(equalToConstant: Const.Image.width),
      heritageImageView.heightAnchor.constraint(equalToConstant: Const.Image.height),
      heritageImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.StackView.top),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Const.StackView.bottom),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.StackView.trailing)
    ])
  }
}
