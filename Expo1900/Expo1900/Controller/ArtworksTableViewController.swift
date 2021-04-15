//
//  ArtworksTableViewController.swift
//  Expo1900
//
//  Created by Ryan-Son on 2021/04/10.
//

import UIKit
import OSLog

final class ArtworksTableViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet private weak var tableView: UITableView!
  private var artworks: [Artwork] = []
  
  // MARK: - Namespaces
  private enum Identifier {
    enum Segue {
      static let artworkDetail: String = "showDetail"
    }
  }
  
  private enum OSLogMessage {
    static let indexPathIsNil: StaticString = "indexPath가 nil입니다."
  }
  
  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let decodedResult: Result = ExpoJSONDecoder.decode(to: [Artwork].self,from: ExpoData.artworks)
    
    switch decodedResult {
    case .success(let result):
      artworks = result
    case .failure(let error):
      debugPrint(error)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    UINavigationController.attemptRotationToDeviceOrientation()
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
    guard let indexPath = tableView.indexPath(for: sender as! UITableViewCell) else {
      os_log(.fault, log: .ui, OSLogMessage.indexPathIsNil)
      return
    }
    
    if segue.identifier == Identifier.Segue.artworkDetail {
      let followingViewController = segue.destination as? ArtworkDetailViewController
      
      followingViewController?.artwork = artworks[indexPath.row]
    }
  }
}
