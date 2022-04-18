//
//  ExpoItemTableViewController.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/13.
//

import UIKit

final class ExpoItemTableViewController: UITableViewController {
  
  private var expoItems = [ExpoItem]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.parse()
  }
}

// MARK: - Private Extension

private extension ExpoItemTableViewController {
  
  func parse() {
    let parsedResult = [ExpoItem].decode(with: "AssetName.expoItem")
    switch parsedResult {
    case let .success(expoItems):
      self.expoItems = expoItems
    case let .failure(error):
      alertBuilder
        .setTitle(error.localizedDescription)
        .setConfirmTitle(Const.confirm)
        .showAlert()
    }
  }
}

// MARK: - Delegate

extension ExpoItemTableViewController {
  
  override func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    guard let detailViewController = self.storyboard?.instantiateViewController(
      withIdentifier: ExpoItemDetailViewController.identifier) as? ExpoItemDetailViewController
    else {
      return
    }
    detailViewController.setUpExpoItem(self.expoItems[indexPath.row])
    self.navigationController?.pushViewController(detailViewController, animated: true)
  }
}

// MARK: - DataSource

extension ExpoItemTableViewController {

  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return self.expoItems.count
  }
  
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = self.tableView.dequeueReusableCell(
      withIdentifier: ExpoItemTableViewCell.identifier,
      for: indexPath) as? ExpoItemTableViewCell
    else {
      return UITableViewCell()
    }
    cell.expoItemTitleLabel.text = self.expoItems[indexPath.row].name
    cell.expoItemDescriptionLabel.text = self.expoItems[indexPath.row].shortDescription
    cell.expoItemImageView.image = UIImage(named: self.expoItems[indexPath.row].imageName)
    return cell
  }
}
