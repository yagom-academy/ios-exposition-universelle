//
//  KoreaEntryListViewController.swift
//  Expo1900
//
//  Created by MARY on 2023/06/30.
//

import UIKit

class KoreaEntryListViewController: UIViewController {
    @IBOutlet weak var entryListTableView: UITableView!
    private let itemsModel: [ItemsModel]? = {
        guard let dataAsset = NSDataAsset(name: "items") else { return nil }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let items = try? decoder.decode([ItemsModel].self, from: dataAsset.data)
        return items
    }()
    let cellIdentifier: String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryListTableView.dataSource = self
    }
}

extension KoreaEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfEntries = itemsModel?.count else {
            return 0
        }
        return numberOfEntries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let koreaEntryCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? KoreaEntryTableViewCell else {
            return UITableViewCell()
        }
        
        koreaEntryCell.entryImageView.image = UIImage(named: itemsModel?[indexPath.row].imageName ?? "photo")
        koreaEntryCell.titleLabel.text = itemsModel?[indexPath.row].name
        koreaEntryCell.shortDescLabel.text = itemsModel?[indexPath.row].shortDesc
        
        return koreaEntryCell
    }
}
