//
//  Expo1900 - ItemsViewController.swift
//  Created by Christy, Rhode.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ItemsViewController: UIViewController {
    private var exhibitItems: [ExhibitItem] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        exhibitItems = decodeJson()
        navigationItem.title = NameSpace.itemViewTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeJson() -> [ExhibitItem] {
        let emptyArray: [ExhibitItem] = []
        let decoder: JSONDecoder = JSONDecoder()
        
        guard let items: NSDataAsset = NSDataAsset(name: "items") else { return emptyArray }

        guard let decodedItems: [ExhibitItem] = try? decoder.decode([ExhibitItem].self, from: items.data) else { return emptyArray }
        
        return decodedItems
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let exhibitItem: ExhibitItem = exhibitItems[indexPath.row]
        cell.textLabel?.text = exhibitItem.name
        cell.detailTextLabel?.text = exhibitItem.shortDescription
        cell.imageView?.image = UIImage(named: exhibitItem.imageName)
        
        return cell
    }
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemDetailView: ExhibitItemViewController = storyboard?.instantiateViewController(identifier: "exhibitItemViewController", creator: { creator in
            let item = self.exhibitItems[indexPath.row]
            let viewController = ExhibitItemViewController(item: item, coder: creator)
            
            return viewController
        }) {
            navigationController?.pushViewController(itemDetailView, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
