//
//  ExpositionItemListViewController.swift
//  Expo1900
//
//  Created by idinaloq, hoon on 2023/06/28.
//

import UIKit

class ExpositionItemListViewController: UIViewController {
    private var itemList: [Item] = []
    
    private let itemListTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "한국의 출품작"
        decodeItems()
        view.backgroundColor = .systemBackground
        itemListTableView.delegate = self
        itemListTableView.dataSource = self
        itemListTableView.register(ItemUITableViewCellStyleSubtitle.self, forCellReuseIdentifier: "cell")
        view.addSubview(itemListTableView)
        configureItemListTableViewConstraint()
    }
    
    private func decodeItems() {
        do {
            itemList = try JSONDecoder().decode([Item].self, from: "items")
        } catch {
            print(error)
        }
    }
    
    private func configureItemListTableViewConstraint() {
        NSLayoutConstraint.activate([
            itemListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            itemListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ExpositionItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemUITableViewCellStyleSubtitle else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = itemList[indexPath.row].name
        cell.detailTextLabel?.text = itemList[indexPath.row].shortDescription
        cell.imageView?.image = UIImage(named: itemList[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let expositionItemViewController: ExpositionItemViewController = ExpositionItemViewController(item: itemList[indexPath.row])
        navigationController?.pushViewController(expositionItemViewController, animated: true)
    }
    
}
