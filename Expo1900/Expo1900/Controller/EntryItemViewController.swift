//
//  EntryItemViewController.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/15.
//

import UIKit

final class EntryItemViewController: UIViewController {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDiscription: UILabel!
    
    var item: ExpositionItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationItem.backButtonTitle = Exposition.koreaEntryList
        itemDiscription.text = item?.description
        itemImage.image = UIImage(named: item?.imageName ?? Exposition.emptyImage)
    }
}
