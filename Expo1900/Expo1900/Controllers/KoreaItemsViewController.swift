//
//  KoreaItemsViewController.swift
//  Expo1900
//
//  Created by kaki, brody on 2023/02/21.
//

import UIKit

final class KoreaItemsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var expositionItems: [ExpositionUniverselleItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        registerXib()
        do {
            expositionItems = try JSONDecoder().loadJSONData(name: AssetName.items, type: [ExpositionUniverselleItem].self)
            setupTableView()
        } catch {
            showFailAlert()
        }
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: ExpositionTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ExpositionTableViewCell.identifier)
    }
    
    private func setupNavigation() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension KoreaItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpositionTableViewCell.identifier) as? ExpositionTableViewCell,
              let expositionItem = expositionItems[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(item: expositionItem)
        
        return cell
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let itemDetailVC = storyboard?.instantiateViewController(identifier: ItemDetailViewController.identifier, creator: { creator in
            let item = self.expositionItems[indexPath.row]
            let viewController = ItemDetailViewController(item: item, coder: creator)
            return viewController
        }) {
            self.navigationController?.pushViewController(itemDetailVC, animated: true)
        }
    }
}
