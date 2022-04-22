//
//  ExpoItemTableViewController.swift
//  Expo1900
//
//  Created by 조민호 on 2022/04/13.
//

import UIKit

fileprivate extension Constants {
  static let notice = "알림"
  static let confirm = "확인"
}

final class ExpoItemTableViewController: UITableViewController {
  
  private var expoItems = [ExpoItem]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.parse()
  }
}

// MARK: - Private Extension

extension ExpoItemTableViewController: AlertPresentable {
  
  private func parse() {
    let parsedResult = [ExpoItem].parseJSON(with: AssetName.expoItem)
    switch parsedResult {
    case let .success(expoItems):
      self.expoItems = expoItems
    case let .failure(error):
      let alert = self.makeAlertController(
        title: Constants.notice,
        message: error.localizedDescription,
        preferredStyle: .alert,
        actions: [UIAlertAction(title: Constants.confirm, style: .default)]
      )
      self.present(alert, animated: true)
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
