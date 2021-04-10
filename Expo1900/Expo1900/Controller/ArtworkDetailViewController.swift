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
    
    var artworks: [Artwork]?
    let jsonDecoder = CustomJSONDecoder()
    
    do {
      artworks = try jsonDecoder.decode(to: [Artwork].self, from: "items")
    } catch {
      print(error.localizedDescription)
    }
    
    guard let unwrappedArtworks = artworks else { return }
    
    self.navigationItem.title = unwrappedArtworks[artworkIdentifier!].name
    artworkImage.image = UIImage(named: unwrappedArtworks[artworkIdentifier!].imageName)
    artworkDescription.text = unwrappedArtworks[artworkIdentifier!].description
    
    
  }
}
