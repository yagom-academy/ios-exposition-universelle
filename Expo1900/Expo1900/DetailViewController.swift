//
//  DetailViewController.swift
//  Expo1900
//
//  Created by Wonbi on 2022/10/20.
//

import UIKit

class DetailViewController: UIViewController {
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        title = entry?.name
    }

}
