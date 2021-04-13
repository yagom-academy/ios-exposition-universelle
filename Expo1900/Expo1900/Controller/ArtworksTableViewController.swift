//
//  ArtworksTableViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/10.
//

import UIKit

final class ArtworksTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var artworks: [Artwork] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    // MARK: - Decode JSON and update UI
    
    let decodedResult: Result = ExpoJSONDecoder.decode(
      to: [Artwork].self,
      from: ExpoData.artworks.rawValue
    )
    
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
    let cell: ArtworkTableViewCell = tableView.dequeueReusableCell(
      withIdentifier: "artworkTableViewCell",
      for: indexPath
    ) as! ArtworkTableViewCell
    
    cell.cellImageView.image = UIImage(named: artworks[indexPath.row].imageName)
    cell.titleLabel.text = artworks[indexPath.row].name
    cell.shortDescriptionLabel.text = artworks[indexPath.row].shortDescription
    
    return cell
  }
  
  // MARK: - Table view delegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
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
