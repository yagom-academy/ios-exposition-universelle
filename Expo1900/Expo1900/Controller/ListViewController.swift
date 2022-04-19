//
//  ListViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/14.
//

import UIKit

final class ListViewController: UIViewController {
    @IBOutlet private weak var listTableView: UITableView!
    private var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        navigationItem.title = "한국의 출품작"
        items = Item.getItems(view: self)
    }
}
//MARK: - about tableview
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath)
        guard let itemCell = cell as? ItemTableViewCell else { return cell }
        itemCell.itemImageView.image = UIImage(named: items[safe: indexPath.row].imageName)
        itemCell.titleLabel.text = items[safe: indexPath.row].name
        itemCell.shortDescriptionLabel.text = items[safe: indexPath.row].shortDescription
        return itemCell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let itemVC = storyboard?.instantiateViewController(withIdentifier: ItemViewController.identifier) as? ItemViewController else { return }
        
        itemVC.item = items[safe: indexPath.row]
        navigationController?.pushViewController(itemVC, animated: true)
    }
}
