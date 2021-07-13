//
//  ListTableViewController.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/10.
//

import UIKit

enum TestError: Error {
    case testError
}

class ListTableViewController: UITableViewController {

    var items: [Item] = []
    let showItemDetailSegue = "showItemDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showItemDetailSegue, let destination = segue.destination as? ItemTableViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let item = items[indexPath.row]
            
            destination.itemName = item.name
            destination.itemImage = UIImage(named: item.imageName)
            destination.itemDescription = item.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        obtainExpositionItemData { (result: Result<[Item], TestError>) in
            switch result {
            case .success(let data):
                self.items = data
            case .failure(let error):
                print("실패")
                print(String(describing: error))
                break
            }
        }
    }
    
    func obtainExpositionItemData(completion: @escaping (Result<[Item], TestError>) -> ()) {
        guard let itemDataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            let expositionDatas = try FairJSONDecoder.shared.decoder.decode([Item].self, from: itemDataAsset.data)
            completion(.success(expositionDatas))
        } catch {
            print(String(describing: error))
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        let itemOfRow = items[indexPath.row]
        cell.itemImageView.image = UIImage(named: itemOfRow.imageName)
        cell.itemNameLabel.text = itemOfRow.name
        cell.itemShortDescription.text = itemOfRow.shortDescription
        return cell
    }
    
}
