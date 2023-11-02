//
//  ItemDetailViewController.swift
//  Expo1900
//
//  Created by jyubong, mireu
//

import UIKit

final class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var expositionItem: ExpositionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        detailImageView.image = UIImage(named: expositionItem?.imageName ?? "")
        detailDescriptionLabel.text = expositionItem?.description
        navigationItem.title = expositionItem?.name
    }
}
