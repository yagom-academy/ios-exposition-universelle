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
      // DetailViewController에게 데이터를 보낸다
      if segue.identifier == "showDetail" {
          let vc = segue.destination as? DetailViewController
          
          if let index = sender as? Int {
              let exhibitionWorkCatalog = viewModel.exhibitionWorkInfo(at: index)
              vc?.viewModel.update(model: exhibitionWorkCatalog)
          }
      }
  }
  
  // 셀 개수를 지정한다.
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numOfExhibitionWorkCatalog
  }
  
  // 여러개의 셀을 구분하는 구분자로 "cell"을 설정하고, 가져올 셀들의 위치를 설정한다.
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                   for: indexPath) as? ListCell else {
      return UITableViewCell()
    }
    
    let exhibitionWorkInfo = viewModel.exhibitionWorkInfo(at: indexPath.row)
    cell.update(info: exhibitionWorkInfo)
    
    return cell
  }
  
  // 셀 클릭 이벤트를 지정한다.
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 몇 번째 셀인지 print한다
    print("\(indexPath.row)")
    
    performSegue(withIdentifier: "showDetail", sender: indexPath.row)
  }
}

// custom cell
class ListCell: UITableViewCell {
  @IBOutlet var imgView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var shortDescriptionLabel: UILabel!
  
  func update(info: ExhibitionWorkCell) {
    imgView.image = info.image
    nameLabel.text = info.name
    shortDescriptionLabel.text = info.shortDescription
  }
}

// viewModel
class CatalogViewModel {
  var exhibitionWorkCatalog: [ExhibitionWorkCell] = []
  
  init() {
    let jsonFile = JsonFile(fileName: "items")
    do {
      let exhibition = try jsonFile.decode(type: Catalog())
      for work in exhibition.catalog {
        let exhibitionWorkInfo = ExhibitionWorkCell(name: work.name,
                                                    imageName: work.imageName,
                                                    shortDescription: work.shortDescription,
                                                    description: work.description)
        exhibitionWorkCatalog.append(exhibitionWorkInfo)
      }
    } catch {
      print(error)
    }
  }
  
  var numOfExhibitionWorkCatalog: Int {
    return exhibitionWorkCatalog.count
  }
  
  func exhibitionWorkInfo(at index: Int) -> ExhibitionWorkCell {
    return exhibitionWorkCatalog[index]
  }
}
