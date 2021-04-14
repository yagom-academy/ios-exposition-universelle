//
//  ArtworksTableViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/10.
//

import UIKit
import OSLog

final class ArtworksTableViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  private var artworks: [Artwork] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: - Decode JSON and insert to the UI elements
    let decodedResult: Result = ExpoJSONDecoder.decode(to: [Artwork].self,from: ExpoData.artworks)
    
    switch decodedResult {
    case .success(let result):
      artworks = result
    case .failure(let error):
      debugPrint(error)
    }
  }
}

// MARK: - Table view data source
extension ArtworksTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return artworks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ArtworkTableViewCell = tableView.dequeueReusableCell(
      withIdentifier: "artworkTableViewCell",
      for: indexPath
    ) as! ArtworkTableViewCell
    
    cell.thumbnailImageView.image = UIImage(named: artworks[indexPath.row].imageName)
    cell.titleLabel.text = artworks[indexPath.row].name
    cell.shortDescriptionLabel.text = artworks[indexPath.row].shortDescription
    
    return cell
  }
}

// MARK: - Table view delegate
extension ArtworksTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
  }
}

// MARK: - View controller: segue
extension ArtworksTableViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let indexPath = tableView.indexPathForSelectedRow

    if segue.identifier == "showDetail" {
      let followingViewController = segue.destination as? ArtworkDetailViewController
      guard let rowOfIndexPath: Int = indexPath?.row else {
        os_log(.fault, log: .ui, "indexPath가 nil입니다.")
        return
      }
      
      followingViewController?.artwork = artworks[rowOfIndexPath]
    }
  }
}
