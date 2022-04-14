//
//  HeritageViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

class HeritageViewController: UIViewController {
  private let tableView = UITableView()
  private var heritageList = [Heritage]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
    layout()
  }
  
  private func attribute() {
    view.backgroundColor = .systemBackground
    title = "한국의 출품작"
    
    tableView.register(HeritageCell.self, forCellReuseIdentifier: HeritageCell.identifier)
    tableView.dataSource = self
    tableView.delegate = self
    
    prepareData()
  }
  
  private func prepareData() {
    guard let heritages = ParseManager<[Heritage]>.parse(name: "items") else {
      return
    }
    heritageList = heritages
  }
  
  private func layout() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}

extension HeritageViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return heritageList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: HeritageCell.identifier,
      for: indexPath
    ) as? HeritageCell else {
      return UITableViewCell()
    }
    
    let heritage = heritageList[indexPath.row]
    cell.update(with: heritage)
    
    return cell
  }
}

extension HeritageViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let heritage = heritageList[indexPath.row]
    let heritageDetailViewController = HeritageDetailViewController(heritage: heritage)
    navigationController?.pushViewController(heritageDetailViewController, animated: true)
  }
}
