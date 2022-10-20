//
//  KoreanItemViewController.swift
//  Expo1900

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var items: [Item] = []
    let cellIdentifier: String = "itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.items = try JSONDecoder().decode([Item].self, from: dataAsset.data)
        } catch {
            print(error)
        }
        
        self.tableView.reloadData()
        self.tableView.dataSource = self
        self.navigationItem.backButtonTitle = "한국의 출품작"
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: Item = self.items[indexPath.row]
        
        guard let nextViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "item") as? ItemViewController else { return }
        
        nextViewController.title = item.name
        nextViewController.item = item
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ItemTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.itemImage.image = UIImage(named: items[indexPath.row].imageName)
        cell.itemLabel.text = items[indexPath.row].name
        cell.itemDescription.text = items[indexPath.row].shortDescription
        cell.translatesAutoresizingMaskIntoConstraints = true
        cell.itemDescription.sizeToFit()
        return cell
    }
}
