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
        tableView.delegate = self
        navigationItem.backButtonTitle = "한국의 출품작"
    }
}

extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let entryItemViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryItemViewController") as? EntryItemViewController {
            let item = expositionItems?[indexPath.row]
            entryItemViewController.navigationItem.title = item?.name
            entryItemViewController.item = item
            self.navigationController?.pushViewController(entryItemViewController, animated: false)
        }
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell ?? CustomCell()
        let item = expositionItems?[indexPath.row]
        cell.imageView?.image = UIImage(named: item?.imageName ?? "")
        cell.itemTitle.text = item?.name
        cell.itemShortDiscription.text = item?.shortDescription
        return cell
    }
}

class CustomCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemShortDiscription: UILabel!
}
