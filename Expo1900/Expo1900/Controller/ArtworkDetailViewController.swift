//
//  ArtworkDetailViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/11.
//

import UIKit
import OSLog

final class ArtworkDetailViewController: UIViewController {
  @IBOutlet weak var artworkImageView: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  var artwork: Artwork?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and update UI
    guard let artwork: Artwork = artwork else { return }
    
    insertDataToUI(from: artwork)
  }
}

// MARK: - Method for inserting data to the UI elements
extension ArtworkDetailViewController {
  private func insertDataToUI(from data: Artwork) {
    self.navigationItem.title = data.name
    artworkImageView.image = UIImage(named: data.imageName)
    descriptionTextView.text = data.description
  }
}
