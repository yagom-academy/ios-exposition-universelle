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
        let nibName = UINib(nibName: "ExpositionTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ExpositionTableViewCell.reuseIdentifier)
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
        let item = expositionItems[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpositionTableViewCell.reuseIdentifier) as? ExpositionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.itemImageView.image = UIImage(named: item.imageName)
        cell.itemTitleLabel.text = item.name
        cell.itemSubtitleLabel.text = item.shortDescription
        
        return cell
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let itemDetailVC = storyboard?.instantiateViewController(identifier: "ItemDetailViewController", creator: { creator in
            let item = self.expositionItems[indexPath.row]
            let viewController = ItemDetailViewController(item: item, coder: creator)
            return viewController
        }) {
            self.navigationController?.pushViewController(itemDetailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
