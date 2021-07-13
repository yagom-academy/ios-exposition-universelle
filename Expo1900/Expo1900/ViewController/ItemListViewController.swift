//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by 잼킹 on 2021/07/07.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet private weak var itemListTableView: UITableView!
    private var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initItems()
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = itemListTableView.indexPathForSelectedRow,
              let itemDetailView = segue.destination as? ItemDetailViewController else {
            return
        }
        itemDetailView.setItem(item: items[indexPath.row])
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cellIdentifier = "itemCell"
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: cellIdentifier,
                for: indexPath
        ) as? ItemTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(data: items[indexPath.row])
        return cell
    }
}

extension ItemListViewController: JSONDecodable {
    typealias JSONModel = [Item]
    
    private func initItems() {
        let itemsFileName = "items"

        do {
            items = try decodeJSON(fileName: itemsFileName)
        } catch {
            self.navigationItem.title = .pageError
        }
    }
}
