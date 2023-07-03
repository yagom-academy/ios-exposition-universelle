//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by Hemg, RedMango on 2023/06/28.
//

import UIKit

final class ItemListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        showNavigationBar()
        loadItems()
    }
    
    private func showNavigationBar() {
        self.title = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func loadItems() {
        let decoder = JSONDecoder()
        
        guard let asset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            items = try decoder.decodingContentInfo(with: asset.data, modelType: [Item].self)
        } catch {
            print(error)
        }
    }
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expositionItemCell", for: indexPath)
        let item = items[indexPath.row]
        var content = cell.defaultContentConfiguration()

        cell.accessoryType = .disclosureIndicator
        
        content.image = UIImage(named: item.imageName)
        content.text = item.name
        content.secondaryText = item.shortDescription
        
        cell.contentConfiguration = content
        cell.separatorInset.left = 0

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let detailItemViewController = storyboard.instantiateViewController(identifier: "DetailItemViewController") { coder in DetailItemViewController(item: item, coder: coder) }
 
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detailItemViewController, animated: true)
    }
}
