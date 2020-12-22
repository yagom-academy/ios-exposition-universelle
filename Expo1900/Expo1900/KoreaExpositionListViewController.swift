//
//  KoreaExpositionListViewController.swift
//  Expo1900
//
//  Created by Yeon on 2020/12/22.
//

import Foundation
import UIKit

class KoreaExpositionListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let decoder: JSONDecoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "메인"
        self.navigationItem.title = "한국의 출품작"
    }
}
