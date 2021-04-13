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
  var artworkIdentifier: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and update UI
    
    let decodedResult: Result = ExpoJSONDecoder.decode(to: [Artwork].self,from: ExpoData.artworks)
    
    switch decodedResult {
    case .success(let artworks):
      insertDataToUI(from: artworks)
    case .failure(let error):
      debugPrint(error)
    }
  }
}

// MARK: - Method for inserting data to the UI elements

extension ArtworkDetailViewController {
  @discardableResult
  private func insertDataToUI(from data: [Artwork]) -> Result<Int, ExpoAppError> {
    guard let artworkIdentifier: Int = artworkIdentifier else {
      os_log("TableView의 indexPath.row가 nil이에요.", log: .ui, type: .error)
      return .failure(ExpoAppError.foundNil("artworkIdentifier"))
    }
    
    self.navigationItem.title = data[artworkIdentifier].name
    artworkImageView.image = UIImage(named: data[artworkIdentifier].imageName)
    descriptionTextView.text = data[artworkIdentifier].description
    return .success(artworkIdentifier)
  }
}
