//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

final class ExpositionItemDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    private var expositionItem: ExpositionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func setUpExpositionItem(to selectedItem: ExpositionItem) {
        expositionItem = selectedItem
    }
    
    private func configureUI() {
        let imageHeight = CGFloat(150)
        detailImageView.image = UIImage(named: expositionItem?.imageName ?? "")?.resized(height: imageHeight)
        
        detailDescriptionLabel.text = expositionItem?.description
        navigationItem.title = expositionItem?.name
    }
}
