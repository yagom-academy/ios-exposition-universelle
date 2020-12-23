//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 임성민 on 2020/12/23.
//

import UIKit

class ItemsViewController: UIViewController {
    @IBOutlet weak var itemsTableView: UITableView!
    
    private let cellIdentifier = "item"
    private let itemsDataModel = DataModel<[Item]>(fileName: "items")
    private var items: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        
        do {
            self.items = try itemsDataModel.requestData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemsCount = self.items?.count else { return 0 }
        return itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemsTableViewCell = itemsTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? ItemsTableViewCell else { return UITableViewCell() }
        
        guard let item = self.items?[indexPath.row] else { return UITableViewCell() }
        let itemImage = UIImage(named: item.imageName)
        
        itemsTableViewCell.nameLabel.text = item.name
        itemsTableViewCell.shortDescriptionLabel.text = item.shortDescription
        itemsTableViewCell.itemImageView.image = itemImage
        
        return itemsTableViewCell
    }
}
