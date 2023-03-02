//
//  Expo1900 - ItemListViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ItemListViewController: UIViewController {
    static let viewIdentifier = "itemListViewController"
    private var exhibitItems: [ExhibitItem] = Decoder().decodeItemsJson()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureTitle()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureTitle() {
        navigationItem.title = NameSpace.itemViewTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    
    private func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as? CustomTableViewCell else { return CustomTableViewCell() }
        
        let exhibitItem: ExhibitItem = exhibitItems[indexPath.row]
        cell.configure(exhibitItem: exhibitItem)
        
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemDetailView: ItemDetailViewController = storyboard?.instantiateViewController(identifier: ItemDetailViewController.viewIdentifier, creator: { creator in
            let item = self.exhibitItems[indexPath.row]
            let itemDetailViewController = ItemDetailViewController(item: item, coder: creator)
            
            return itemDetailViewController
        }) {
            navigationController?.pushViewController(itemDetailView, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
