//
//  ExpositionItemsViewController.swift
//  Expo1900
//
//  Created by hy on 2022/10/20.
//

import UIKit

class ExpositionItemsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ExpositionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ExpositionItemsViewController: UITableViewDelegate { }
