//
//  ExpoItemTableViewController.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/13.
//

import UIKit

fileprivate extension Constants {
  static let confirm = "확인"
}

final class ExpoItemTableViewController: UITableViewController, AlertPresentable {
  
  private var expoItems = [ExpoItem]()
  
  lazy var alertBuilder: AlertBuilderable = AlertBuilder(viewController: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.parse()
  }
}

// MARK: - Private Extension

private extension ExpoItemTableViewController {
  
  func parse() {
    let parsedResult = [ExpoItem].parseJSON(with: AssetName.expoItem)
    switch parsedResult {
    case let .success(expoItems):
      self.expoItems = expoItems
    case let .failure(error):
      alertBuilder
        .setTitle(error.localizedDescription)
        .setConfirmTitle(Constants.confirm)
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
    cell.setUpContentView(self.expoItems[indexPath.row])
    return cell
  }
}
