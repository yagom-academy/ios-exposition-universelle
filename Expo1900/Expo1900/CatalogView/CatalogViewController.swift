//
//  CatalogViewController.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  static let cellIdentifier = "catalogCell"
  static let segueIdentifier = "detailView"
  
  let viewModel = CatalogViewModel()
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "detailView" {
      let detailvc = segue.destination as? DetailViewController

      if let cell = sender as? CatalogCell {
        // FIXME: - table view 클릭한 cell의 index를 가져오는 방법 변경 요망
        let cellIndex = Int(cell.frame.minY)/200
        let exhibitionWorkCatalog = viewModel.exhibitionWorkInfo(at: cellIndex)
        detailvc?.viewModel.update(model: exhibitionWorkCatalog)
      }
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numOfExhibitionWorkCatalog
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let catalogCell = tableView.dequeueReusableCell(
            withIdentifier: CatalogViewController.cellIdentifier, for: indexPath) as?
            CatalogCell else {
      return UITableViewCell()
    }
    
    let exhibitionWorkInfo = viewModel.exhibitionWorkInfo(at: indexPath.row)
    catalogCell.update(info: exhibitionWorkInfo)
    
    return catalogCell
  }
}
