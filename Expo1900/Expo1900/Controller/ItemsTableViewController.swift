//
//  ItemsTableViewController.swift
//  Expo1900
//
//  Created by Erick, 비모 on 2023/06/27.
//

import UIKit

final class ItemsTableViewController: UITableViewController {
    static let id = "itemsTableViewControllerID"
    
    private var items: [Item] = []
    private let navigationTitle: String
    
    init?(navigationTitle: String, coder: NSCoder) {
        self.navigationTitle = navigationTitle
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navigationTitle
        decodeJSONToItems()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemTableViewCell.id
        ) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        
        cell.setItemImageViewImage(UIImage(named: item.imageName))
        cell.setNameLabelText(item.name)
        cell.setShortDesctionLabel(item.shortDescription)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nextViewController = storyboard?.instantiateViewController(
            identifier: ItemDetailViewController.id,
            creator: { coder in
                return ItemDetailViewController(item: self.items[indexPath.row], coder: coder)
            }
        ) {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    private func decodeJSONToItems() {
        do {
            items = try Item.decodeItems()
        } catch NSDataAssetError.assetNotFound {
            print("JSON Asset을 찾지 못했습니다.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
