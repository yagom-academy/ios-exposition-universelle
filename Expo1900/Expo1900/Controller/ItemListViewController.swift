//
//  KoreanItemViewController.swift
//  Expo1900

import UIKit

final class ItemListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var items: [Item] = []
    private let cellIdentifier: String = "itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            showDataErrorAlert()
            return
        }
        
        do {
            self.items = try JSONDecoder().decode([Item].self, from: dataAsset.data)
        } catch {
            showDataErrorAlert()
            printErrorLog()
        }
        
        self.title = "한국의 출품작"
        self.navigationItem.backButtonTitle = "한국의 출품작"
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: Item = self.items[indexPath.row]
        
        guard let nextViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "item") as? ItemViewController else {
            showTransitionErrorAlert()
            return
        }
        
        nextViewController.item = item
        navigationController?.pushViewController(nextViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! ItemListTableViewCell
        cell.itemImage.image = UIImage(named: items[indexPath.row].imageName)
        cell.title.text = items[indexPath.row].name
        cell.subtitle.text = items[indexPath.row].shortDescription
        
        return cell
    }
}
