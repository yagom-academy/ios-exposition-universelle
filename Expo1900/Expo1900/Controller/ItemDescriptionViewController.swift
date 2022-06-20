//
//  itemDescriptionViewController.swift
//  Expo1900
//
//  Created by Kiwi, Finnn on 2022/06/16.
//

import UIKit

final class ItemDescriptionViewController: UIViewController {
    
    var entryInfo: Entry? {
        didSet {
            itemDescriptionScrollView.itemDetailInfo = entryInfo
        }
    }
    
    private let itemDescriptionScrollView = ItemDescriptionUIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = entryInfo?.name
    }
    
    override func loadView() {
        view = itemDescriptionScrollView
    }
}
