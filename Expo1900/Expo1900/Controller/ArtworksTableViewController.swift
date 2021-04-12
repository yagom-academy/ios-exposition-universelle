//
//  ArtworksTableViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/10.
//

import UIKit

class ArtworksTableViewController: UIViewController {
  
  @IBOutlet weak var artworksTableView: UITableView!
  
  private var artworks: [Artwork] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    artworksTableView.delegate = self
    artworksTableView.dataSource = self
    
    // MARK: - Decode JSON and update UI
    
    let decodedResult: Result = CustomJSONDecoder.decode(to: [Artwork].self, from: "items")
    
    switch decodedResult {
    case .success(let result):
      artworks = result
    case .failure(let error):
      debugPrint(error)
    }
  }
}
  
extension ArtworksTableViewController: UITableViewDelegate, UITableViewDataSource {
  // MARK: - Table view data source
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return artworks.count
  }
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ArtworkTableViewCell = artworksTableView.dequeueReusableCell(withIdentifier: "artworkTableViewCell",
                                                                           for: indexPath) as! ArtworkTableViewCell
    
    cell.artworkImageView.image = UIImage(named: artworks[indexPath.row].imageName)
    cell.artworkTitleLabel.text = artworks[indexPath.row].name
    cell.artworkShortDescriptionLabel.text = artworks[indexPath.row].shortDescription
   
   return cell
   }
  
  // MARK: - Table view delegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "showDetail", sender: indexPath.row)
  }
}

extension ArtworksTableViewController {
  // MARK: - View controller: segue
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      let followingViewController = segue.destination as? ArtworkDetailViewController
      if let identifier: Int = sender as? Int {
        followingViewController?.artworkIdentifier = identifier
      }
    }
  }
}
