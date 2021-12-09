//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 이승재 on 2021/12/09.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        itemsTableView.dataSource = self
    }
    
    func setTitle() {
        self.title = "한국의 출품작"
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
