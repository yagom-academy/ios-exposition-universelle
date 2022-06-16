//
//  itemDescriptionViewController.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

class ItemDescriptionViewController: UIViewController {
    
    let itemDescriptionScrollView = ItemDescriptionUIScrollView()
    var entryInfo: Entry? {
        didSet {
            itemDescriptionScrollView.itemDetailInfo = entryInfo
        }
    }
    override func loadView() {
        view = ItemDescriptionUIScrollView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
