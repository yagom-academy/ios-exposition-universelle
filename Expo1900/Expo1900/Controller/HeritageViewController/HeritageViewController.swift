//
//  HeritageViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

//MARK: - Const

extension HeritageViewController {
  private enum Const {
    enum File {
      static let name = "items"
    }
    
    enum Navigation {
      static let title = "한국의 출품작"
    }
  }
}

//MARK: - ViewController

final class HeritageViewController: UIViewController, Alertable {
  private lazy var baseView = HeritageView(frame: view.bounds)
  private var heritageList: [Heritage]? {
    didSet {
      DispatchQueue.main.async {
        self.baseView.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    request(name: Const.File.name) { result in
      switch result {
      case .success(let data):
        heritageList = data
      case .failure(let error):
        showAlert(errorMessage: error.localizedDescription, viewController: self)
      }
    }
  }
  
  private func attribute() {
    view = baseView
    view.backgroundColor = .systemBackground
    title = Const.Navigation.title
    
    baseView.tableView.register(HeritageCell.self, forCellReuseIdentifier: HeritageCell.identifier)
    baseView.tableView.dataSource = self
    baseView.tableView.delegate = self
  }
  
  private func request(name: String, completion: (Result<[Heritage], ParseError>) -> Void) {
    guard let data = NSDataAsset(name: name)?.data else {
      completion(.failure(.invalidName))
      return
    }
    do {
      let decodedData = try JSONDecoder().decode([Heritage].self, from: data)
      completion(.success(decodedData))
    } catch {
      completion(.failure(.decodeFail))
    }
  }
}

//MARK: - TableView DataSource

extension HeritageViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return heritageList?.count ?? .zero
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: HeritageCell.identifier,
      for: indexPath
    ) as? HeritageCell else {
      return UITableViewCell()
    }
    
    cell.update(with: heritageList?[safe: indexPath.row])
    
    return cell
  }
}

//MARK: - TableView Delegate

extension HeritageViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let heritage = heritageList?[safe: indexPath.row] else {
      return
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    let heritageDetailViewController = HeritageDetailViewController(heritage: heritage)
    navigationController?.pushViewController(heritageDetailViewController, animated: true)
  }
}
