//
//  HeritageViewController.swift
//  Expo1900
//
//  Created by Taeangel, dudu on 2022/04/13.
//

import UIKit

class HeritageViewController: UIViewController {
  private lazy var baseView = HeritageView(frame: view.bounds)
  private var heritageList = [Heritage]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    attribute()
  }
  
  private func attribute() {
    view = baseView
    view.backgroundColor = .systemBackground
    title = "한국의 출품작"
    
    baseView.tableView.register(HeritageCell.self, forCellReuseIdentifier: HeritageCell.identifier)
    baseView.tableView.dataSource = self
    baseView.tableView.delegate = self
    
    prepareData()
  }
  
  private func prepareData() {
    guard let heritages = ParseManager<[Heritage]>.parse(name: "items") else {
      return
    }
    heritageList = heritages
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
