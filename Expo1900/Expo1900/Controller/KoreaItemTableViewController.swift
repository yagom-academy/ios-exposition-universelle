//
//  KoreaItemsTableViewController.swift
//  Expo1900
//
//  Created by Brad, Groot on 2022/06/17.
//

import UIKit

final class KoreaItemTableViewController: UITableViewController {
    //MARK: - KoreaItemTable Property
    
    private var koreaItems = [KoreaItem]()
    private weak var sendDataDelegate: SendDataDelegate?
    
    //MARK: - KoreaItemTable View
    
    private let itemTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(KoreaItemTableViewCell.self, forCellReuseIdentifier: KoreaItemTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = DetailSetUp.title
        self.navigationController?.isNavigationBarHidden = false
        self.tableView = itemTableView
        setKoreaItems()
    }
    
    //MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreaItemTableViewCell.identifier, for: indexPath) as? KoreaItemTableViewCell else {
            return UITableViewCell()
        }
        cell.itemImageView.image = koreaItems[indexPath.row].image
        cell.titleLabel.text = koreaItems[indexPath.row].name
        cell.shortDescriptionLabel.text = koreaItems[indexPath.row].shortDescription
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailViewController = KoreaItemDetailViewController()
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
        sendDataDelegate = itemDetailViewController
        sendDataDelegate?.sendItemData(item: koreaItems[indexPath.row])
    }
    
    //MARK: - Setting Data Method
    
    private func setKoreaItems() {
        guard let items = NSDataAsset(name: Asset.KoreaItem),
              let decodedKoreaItems = try? JSONDecoder().decode([KoreaItem].self, from: items.data) else {
            return
        }
        self.koreaItems = decodedKoreaItems
    }
}

//MARK: - NameSpace for Setting View Detail Option

extension KoreaItemTableViewController {
    private enum DetailSetUp {
        static let title = "한국의 출품작"
    }
}
