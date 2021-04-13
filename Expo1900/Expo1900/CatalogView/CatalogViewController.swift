//
//  CatalogViewController.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  let viewModel = CatalogViewModel()
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "detailView" {
          let detailvc = segue.destination as? DetailViewController
          
          if let index = sender as? Int {
              let exhibitionWorkCatalog = viewModel.exhibitionWorkInfo(at: index)
              detailvc?.viewModel.update(model: exhibitionWorkCatalog)
          }
      }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numOfExhibitionWorkCatalog
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                   for: indexPath) as? ListCell else {
      return UITableViewCell()
    }
    
    let exhibitionWorkInfo = viewModel.exhibitionWorkInfo(at: indexPath.row)
    cell.update(info: exhibitionWorkInfo)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "detailView", sender: indexPath.row)
  }
}
