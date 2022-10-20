//
//  KoreanItemViewController.swift
//  Expo1900

import UIKit

final class ItemListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var items: [Item] = []
    let cellIdentifier: String = "itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            showDataErrorAlert()
            return
        }
        
        do {
            self.items = try JSONDecoder().decode([Item].self, from: dataAsset.data)
        } catch {
            showDataErrorAlert()
            print(error)
        }
        
        self.tableView.reloadData()
        self.tableView.dataSource = self
        self.navigationItem.backButtonTitle = "한국의 출품작"
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: Item = self.items[indexPath.row]
        
        guard let nextViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "item") as? ItemViewController else {
            showTransitionAlert()
            return
        }
        
        nextViewController.title = item.name
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
        let cell: UITableViewCell =
                tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        cell.imageView?.image = UIImage(named: items[indexPath.row].imageName)
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].shortDescription
        
        return cell
    }
}
