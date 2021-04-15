//
//  ExhibitItemViewController.swift
//  Expo1900
//
//  Created by 최정민 on 2021/04/09.
//

import UIKit

class ExhibitItemViewController: UIViewController {
    
    static let storyboardID = "ExhibitItemViewController"
    @IBOutlet private var exhibitItemImage: UIImageView!
    @IBOutlet private var exhibitItemDescriptions: UILabel!
    var exhibitItemData: ExhibitItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let exhibitItemData = exhibitItemData else { return }
        self.navigationItem.title = exhibitItemData.name
        exhibitItemImage.image = UIImage(named: exhibitItemData.imageName)
        exhibitItemDescriptions.text = exhibitItemData.descriptions
    }
}
