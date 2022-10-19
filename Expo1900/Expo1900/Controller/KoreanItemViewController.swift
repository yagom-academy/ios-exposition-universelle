//
//  KoreanItemViewController.swift
//  Expo1900

import UIKit

class KoreanItemViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var items: [Item] = []
    let cellIdentifier: String = "itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        do {
            self.items = try jsonDecoder.decode([Item].self, from: dataAsset.data)
        } catch {
            print(error)
        }
        self.tableView.reloadData()
        self.tableView.dataSource = self
        
    }
    
}

extension KoreanItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension KoreanItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.itemImage.image = UIImage(named: items[indexPath.row].imageName)
        cell.itemLabel.text = items[indexPath.row].name
        cell.itemDescription.text = items[indexPath.row].shortDesc
        cell.translatesAutoresizingMaskIntoConstraints = true
        cell.itemDescription.sizeToFit()
        return cell
    }
}
