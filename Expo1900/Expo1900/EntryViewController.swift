//
//  EntryViewController.swift
//  Expo1900
//
//  Created by junho lee on 2022/10/20.
//

import UIKit

class EntryViewController: UIViewController {
    var expoEntryName: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = expoEntryName
    }

}
