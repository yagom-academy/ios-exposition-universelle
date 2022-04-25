//
//  DetailViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak private var itemImageView: UIImageView!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    private var exhibitionItem: ExhibitionItem?
    
    init?(exhibitionItem: ExhibitionItem, coder: NSCoder) {
        self.exhibitionItem = exhibitionItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView() {
        guard let exhibitionItem = exhibitionItem else {
            return
        }

        self.itemImageView.image = ImageData.load(from: exhibitionItem.imageName)
        self.descriptionLabel.text = exhibitionItem.description
        self.title = exhibitionItem.name
    }
}
