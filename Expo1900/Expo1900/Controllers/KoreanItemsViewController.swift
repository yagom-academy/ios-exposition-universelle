//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by Rhovin, Aejong on 2022/10/21.
//

import UIKit

final class KoreanItemsViewController: UIViewController {
    @IBOutlet private weak var koreanItemsTableView: UITableView!
    private let cellIdentifier: String = "itemCell"
    private var items: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = Converter.decode("items")
        self.koreanItemsTableView.delegate = self
        self.koreanItemsTableView.dataSource = self
    }
}

extension KoreanItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ItemCell = koreanItemsTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.itemImageView?.image = UIImage(named: items?[indexPath.row].imageName ?? "")
        cell.titleLabel?.text = items?[indexPath.row].name
        cell.subtitleLabel?.text = items?[indexPath.row].shortDesc
        
        return cell
    }
}

extension KoreanItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: Bundle.main)
        guard let itemDetailViewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewControllerID") as? ItemDetailViewController else { return }
        itemDetailViewController.selectedItem = items?[indexPath.row]
        
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
}
