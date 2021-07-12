//
//  ItemTableViewController.swift
//  Expo1900
//
//  Created by 신동훈 on 2021/07/12.
//

import Foundation
import UIKit

class ItemTableViewController: UITableViewController {
    var itemName: String?
    var itemImage: UIImage?
    var itemDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = itemName
    }
}
