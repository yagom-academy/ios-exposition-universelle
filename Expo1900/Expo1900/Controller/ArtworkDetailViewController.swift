//
//  ArtworkDetailViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/11.
//

import UIKit
import OSLog

final class ArtworkDetailViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet private weak var artworkImageView: UIImageView!
  @IBOutlet private weak var descriptionTextView: UITextView!
  var artwork: Artwork?
  
  // MARK: - Namespace
  private enum OSLogMessage {
    static let artworkIsNil: StaticString = "Artwork가 Nil입니다."
  }
  
  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let artwork: Artwork = artwork else {
      os_log(.fault, log: .data, OSLogMessage.artworkIsNil)
      return
    }
    
    configureUI(with: artwork)
  }
}

// MARK: - Method for configure the UI elements
extension ArtworkDetailViewController {
  private func configureUI(with data: Artwork) {
    self.navigationItem.title = data.name
    artworkImageView.image = UIImage(named: data.imageName)
    descriptionTextView.text = data.description
  }
}
