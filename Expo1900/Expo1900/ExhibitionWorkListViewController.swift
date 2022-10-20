//
//  ExhibitionWorkListViewController.swift
//  Expo1900
//
//  Created by Som, Stone, Aaron on 2022/10/20.
//

import UIKit

class ExhibitionWorkListViewController: UIViewController {
    @IBOutlet weak var exhibitionWorkTableView: UITableView!
    
    let cellIdentifier: String = "cell"
    var exhibitionWork: [ExhibitionWork] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


