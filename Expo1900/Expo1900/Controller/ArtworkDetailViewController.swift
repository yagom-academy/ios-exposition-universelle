//
//  ArtworkDetailViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/11.
//

import UIKit

final class ArtworkDetailViewController: UIViewController {
  
  @IBOutlet weak var artworkImageView: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  var artworkIdentifier: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and update UI
    
    let decodedResult: Result = ExpoJSONDecoder.decode(to: [Artwork].self, from: "items")
    
    switch decodedResult {
    case .success(let artworks):
      updateUI(from: artworks)
    case .failure(let error):
      debugPrint(error)
    }
  }
}

extension ArtworkDetailViewController {
  
  // MARK: - Method for updating the UI
  
  @discardableResult
  private func updateUI(from data: [Artwork]) -> Result<Int, ExpoAppError> {
    guard let artworkIdentifier: Int = artworkIdentifier else {
      debugPrint(ExpoAppError.foundNil("artworkIdentifier"))
      return .failure(ExpoAppError.foundNil("artworkIdentifier"))
    }
    
    self.navigationItem.title = data[artworkIdentifier].name
    artworkImageView.image = UIImage(named: data[artworkIdentifier].imageName)
    descriptionTextView.text = data[artworkIdentifier].description
    return .success(artworkIdentifier)
  }
}
