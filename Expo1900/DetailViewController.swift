//
//  DetailViewController.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/15.
//

import UIKit

final class DetailViewController: UIViewController, ViewControllerIdentifier {

    @IBOutlet private weak var heritageImage: UIImageView!
    @IBOutlet private weak var heritageDescription: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentsOfDetailView()
    }
}

// MARK: - logic method
extension DetailViewController {
    private func setContentsOfDetailView() {
        guard let itemImageName = item?.imageName else {
            return
        }
        
        heritageImage.image = UIImage(named: itemImageName)
        heritageDescription.text = item?.description
        title = item?.name
    }
}
