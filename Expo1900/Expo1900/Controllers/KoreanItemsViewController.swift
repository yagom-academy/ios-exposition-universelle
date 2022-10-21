//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/21.
//

import UIKit

class KoreanItemsViewController: UIViewController {
    @IBOutlet private weak var koreanItemsTableView: UITableView!
    private let cellIdentifier: String = "itemCell"
    private let jsonDecoder: JSONDecoder = JSONDecoder()
    private var items: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        items = decodeItems("items")
        self.koreanItemsTableView.delegate = self
        self.koreanItemsTableView.dataSource = self
    }
    
    private func decodeItems(_ file: String) -> [Item]? {
        guard let itemsAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        let items = try? jsonDecoder.decode([Item].self, from: itemsAsset.data)
        
        return items
    }
    
}

extension KoreanItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = koreanItemsTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: items?[indexPath.row].imageName ?? "")
        cell.textLabel?.text = items?[indexPath.row].name
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        cell.detailTextLabel?.text = items?[indexPath.row].shortDesc
        cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
        return cell
    }
}

extension KoreanItemsViewController: UITableViewDelegate {
    
}
