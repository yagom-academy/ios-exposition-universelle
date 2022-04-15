//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/15.
//

import UIKit

class EntryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let expositionItems = [ExpositionItems].parse(JsonFile.items)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell ?? CustomCell()
        return cell
    }
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemShortDiscription: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
