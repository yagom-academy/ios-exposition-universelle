//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 강경 on 2021/04/08.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var imgView: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var nameLabel: UINavigationItem!
  @IBOutlet var test: UILabel!
  
  var testtt = 0
  let viewModel = DetailViewModel()
  
  override func viewDidLoad() {
    updateUI()
  }
  
  func updateUI() {
    
    if let detailInfo = self.viewModel.exhibitionWorkCell {
      imgView.image = detailInfo.image
      nameLabel.title = detailInfo.name
      descriptionLabel.text = detailInfo.description
    }
  }
}

// ViewModel
class DetailViewModel {
  var exhibitionWorkCell: ExhibitionWorkCell?
  
  func update(model: ExhibitionWorkCell?) {
    exhibitionWorkCell = model
  }
}
