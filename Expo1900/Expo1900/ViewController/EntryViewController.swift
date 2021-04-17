//
//  EntryViewController.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/15.
//

import UIKit

class EntryViewController: UIViewController {
    var entry: Exposition.Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = entry?.name
        
        if let entry = entry {
            (view as? EntryView)?.putEntryData(from: entry)
        }
    }
}
