//
//  ArtworksTableViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/10.
//

import UIKit

class ArtworksTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var artworksTableView: UITableView!
  
  var artworks: [Artwork]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    artworksTableView.delegate = self
    artworksTableView.dataSource = self
    
    let jsonDecoder = CustomJSONDecoder()
    
    do {
      artworks = try jsonDecoder.decode(to: [Artwork].self, from: "items")
    } catch {
      print(error.localizedDescription)
    }
    
    
    
  }
  
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return artworks!.count
  }
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ArtworkTableViewCell = artworksTableView.dequeueReusableCell(withIdentifier: "artworkTableViewCell", for: indexPath) as! ArtworkTableViewCell
    
    guard let unwrappedArtworks = artworks else { fatalError() }
    
    cell.artworkImageView.image = UIImage(named: unwrappedArtworks[indexPath.row].imageName)
    cell.artworkTitleLabel.text = unwrappedArtworks[indexPath.row].name
    cell.artworkShortDescriptionLabel.text = unwrappedArtworks[indexPath.row].shortDescription
   
   return cell
   }
  
}
