//
//  ArtworkDetailViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/11.
//

import UIKit

final class ArtworkDetailViewController: UIViewController {
  
  @IBOutlet weak var artworkImage: UIImageView!
  @IBOutlet weak var artworkDescription: UITextView!
  
  var artworkIdentifier: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let decodedResult: Result = CustomJSONDecoder.decode(to: [Artwork].self, from: "items")
    
    switch decodedResult {
    case .success(let artworks):
      updateUI(from: artworks)
    case .failure(let error):
      debugPrint(error)
    }
  }
}

extension ArtworkDetailViewController {
  @discardableResult
  private func updateUI(from data: [Artwork]) -> Result<Int, ExpoAppError> {
    guard let artworkIdentifier: Int = artworkIdentifier else {
      debugPrint(ExpoAppError.foundNil("artworkIdentifier"))
      return .failure(ExpoAppError.foundNil("artworkIdentifier"))
    }
    
    self.navigationItem.title = data[artworkIdentifier].name
    artworkImage.image = UIImage(named: data[artworkIdentifier].imageName)
    artworkDescription.text = data[artworkIdentifier].description
    return .success(artworkIdentifier)
  }
}
