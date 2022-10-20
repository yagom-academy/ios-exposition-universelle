//
//  ExhibitionViewController.swift
//  Expo1900
//
//  Created by Gundy, Dragon on 2022/10/20.
//

import UIKit

class ExhibitionViewController: UIViewController {
    var exhibition: Exhibition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let exhibition = exhibition else {
            return
        }
        
        self.navigationItem.title = exhibition.name
    }
}
