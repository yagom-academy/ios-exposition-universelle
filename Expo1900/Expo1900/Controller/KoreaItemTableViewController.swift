//
//  KoreaItemsTableViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

class KoreaItemTableViewController: UITableViewController {
    //MARK: - KoreaItemTable Property
    
    var item = [KoreaItem]()
    weak var sendDataDelegate: SendDataDelegate?
    
    //MARK: - KoreaItemTable View
    
    let itemTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(KoreaItemTableViewCell.self, forCellReuseIdentifier: "KoreaItemTableViewCell")
        return tableView
    }()
    
    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
        self.tableView = itemTableView
        decodingJsonData()
    }
    
    //MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KoreaItemTableViewCell", for: indexPath) as? KoreaItemTableViewCell else {
            return UITableViewCell()
        }
        cell.itemImageView.image = item[indexPath.row].image
        cell.titleLabel.text = item[indexPath.row].name
        cell.shortDescriptionLabel.text = item[indexPath.row].shortDescription
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    //MARK: - Table View Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailViewController = ItemDetailViewController()
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
        sendDataDelegate = itemDetailViewController
        sendDataDelegate?.sendItemData(item: item[indexPath.row])
    }
    
    //MARK: - Decoding JsonData Method
    
    private func decodingJsonData() {
        guard let items = NSDataAsset(name: "items"),
              let decodedKoreaItems = try? JSONDecoder().decode([KoreaItem].self, from: items.data) else {
            return
        }
        self.item = decodedKoreaItems
    }
}
