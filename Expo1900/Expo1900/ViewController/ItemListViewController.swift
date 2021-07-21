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
        initVoiceOver(title: self.navigationController?.navigationBar.topItem?.title)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = itemListTableView.indexPathForSelectedRow,
              let itemDetailView = segue.destination as? ItemDetailViewController else {
            return
        }
        itemDetailView.setItem(item: items[indexPath.row])
    }
    
    func initItems() {
        guard let parsed = ParsedItems().items else {
            self.navigationItem.title = .pageError
            return
        }
        
        items = parsed
    }
    
    func initVoiceOver(title: String?) {
        self.navigationController?.navigationBar.topItem?.accessibilityLabel = "\(title ?? .blank)으로 돌아가기"
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
