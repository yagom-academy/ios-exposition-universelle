//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by unchain,bard on 2022/06/16.
//

import UIKit

final class DescriptionViewController: UIViewController {
    @IBOutlet private(set) weak var imageview: UIImageView!
    @IBOutlet private(set) weak var detailedDescription: UILabel!
    var entryList: EntryList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageview.image = UIImage(named: entryList?.imageName ?? ExpoNameSpace.empty.name)
        self.detailedDescription.text = entryList?.description
        self.title = entryList?.name
        self.imageview.accessibilityLabel = (entryList?.name ?? ExpoNameSpace.empty.name) + "사진"
    }
}
