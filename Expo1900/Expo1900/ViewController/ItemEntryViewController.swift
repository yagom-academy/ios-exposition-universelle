//
//  ItemEntryViewController.swift
//  Expo1900
//
//  Created by 리지, Rowan on 2023/02/22.
//

import UIKit

final class ItemEntryViewController: UIViewController {
    private var items: [Item] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setNavigationBar()
        decodeItemsData()
    }
    
    private func setNavigationBar() {
        let navigationBarTitle = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = navigationBarTitle
    }
    
    private func decodeItemsData() {
        let assetName = "items"
        
        self.items = DecodeManager.decodeData(of: assetName, type: [Item].self) ?? []
    }
    
    private enum Identifier {
        static let cell = "customCell"
        static let descriptionViewController = "descriptionViewController"
    }
}

// MARK: DataSource
extension ItemEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Identifier.cell, for: indexPath
        ) as? CustomTableViewCell else { return UITableViewCell() }
        
        setContents(of: cell, at: indexPath)
        
        return cell
    }
    
    private func setContents(of cell: CustomTableViewCell, at indexPath: IndexPath) {
        guard let itemImage = UIImage(named: items[indexPath.row].imageName) else { return }
        
        cell.itemNameLabel.text = items[indexPath.row].name
        cell.itemNameLabel.font = UIFont.systemFont(ofSize: 25)
        
        cell.shortDescriptionLabel.text = items[indexPath.row].shortDescription
        cell.shortDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        cell.shortDescriptionLabel.numberOfLines = 0
        cell.shortDescriptionLabel.lineBreakMode = .byWordWrapping
        
        cell.itemImageView.image = itemImage
        
        cell.accessoryType = .disclosureIndicator
    }
}

// MARK: Delegate
extension ItemEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController = self.storyboard?.instantiateViewController(
            identifier: Identifier.descriptionViewController,
            creator: { creator in
                let item = self.items[indexPath.row]
                let nextViewController = DescriptionViewController(item: item, coder: creator)
                
                return nextViewController
            }
        ) else { return }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
