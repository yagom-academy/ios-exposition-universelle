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
        let cell: UITableViewCell = koreanItemsTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: items?[indexPath.row].imageName ?? "")
        cell.textLabel?.text = items?[indexPath.row].name
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        cell.detailTextLabel?.text = items?[indexPath.row].shortDesc
        cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        
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
