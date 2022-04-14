//
//  DetailViewController.swift
//  Expo1900
//
//  Created by mmim, Minseong.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var itemImageVIew: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var itemDetailData: ExhibitionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    private func setUpData() {
        itemImageVIew.image = UIImage(named: itemDetailData!.imageName)
        descriptionLabel.text = itemDetailData?.description
        self.title = itemDetailData?.name
    }
}
