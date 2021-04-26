//
//  ItemViewController.swift
//  Expo1900
//
//  Created by 황인우 on 2021/04/13.
//

import UIKit

class ItemViewController: UIViewController {
    var exhibit: Exhibit?
    
    @IBOutlet weak var exhibitDescription: UILabel!
    @IBOutlet weak var exhibitImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let entryItem = exhibit else { return }
        self.exhibitImage.image = UIImage(named: entryItem.imageName)
        self.exhibitDescription.text = entryItem.description
        self.title = entryItem.name

    }

}
