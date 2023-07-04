//
//  ExpositionItemListViewController.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/28.
//

import UIKit

final class ExpositionItemListViewController: UIViewController {
    private var itemList: [Item] = []
    private let customCellIdentifier: String = "cell"
    
    private let itemListTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRootView()
        configureNavigationItem()
        configureItemListTableView()
        configureItemListTableViewConstraint()
        decodeItems()
    }
    
    private func configureRootView() {
        view.backgroundColor = .systemBackground
        view.addSubview(itemListTableView)
    }
    
    private func configureNavigationItem() {
        navigationItem.title = "한국의 출품작"
    }
    
    private func configureItemListTableView() {
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        itemListTableView.register(ItemUITableViewCellStyleSubtitle.self, forCellReuseIdentifier: customCellIdentifier)
    }
    
    private func configureItemListTableViewConstraint() {
        NSLayoutConstraint.activate([
            itemListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            itemListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func decodeItems() {
        do {
            itemList = try JSONDecoder().decode([Item].self, from: JSONFile.items.description)
        } catch NSDataAssetError.invalidDataAsset {
            let alert: UIAlertController = AlertController().configureAlert(errorName: NSDataAssetError.invalidDataAsset.localizedDescription)
            present(alert, animated: true)
        } catch {
            let alert: UIAlertController = AlertController().configureAlert(errorName: error.localizedDescription)
            present(alert, animated: true)
        }
    }
}

extension ExpositionItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as? ItemUITableViewCellStyleSubtitle else {
            return UITableViewCell()
        }
        
        configureCell(with: cell, item: itemList[indexPath.row])
        
        return cell
    }
    
    private func configureCell(with cell: ItemUITableViewCellStyleSubtitle, item: Item) {
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.shortDescription
        cell.imageView?.image = UIImage(named: item.imageName)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let expositionItemViewController: ExpositionItemViewController = ExpositionItemViewController(item: itemList[indexPath.row])
        navigationController?.pushViewController(expositionItemViewController, animated: true)
    }
}
