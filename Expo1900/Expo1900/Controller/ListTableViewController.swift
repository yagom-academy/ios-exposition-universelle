//
//  ListTableViewController.swift
//  Expo1900
//
//  Created by Hosinging, EHD on 2021/07/10.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    //MARK: - Property
    private var items: [Entry] = []
    private let showItemDetailSegue = "showItemDetailSegue"
    
    //MARK: - Preprocess Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showItemDetailSegue, let destination = segue.destination as? ItemTableViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let item = items[indexPath.row]
            destination.item = item
        }
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        obtainExpositionItemData { (result: Result<[Entry], DecodingError>) in
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
    
    //MARK: - Method
    private func obtainExpositionItemData(completion: @escaping (Result<[Entry], DecodingError>) -> ()) {
        guard let itemDataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
            let expositionDatas = try FairJSONDecoder.shared.decoder.decode([Entry].self, from: itemDataAsset.data)
            completion(.success(expositionDatas))
        } catch {
            print(String(describing: error))
            completion(.failure(DecodingError.failedToDecode))
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
        if let itemImage = UIImage(named: itemOfRow.imageName) {
            cell.configure(itemImage: itemImage, itemName: itemOfRow.name, itemShortDescription: itemOfRow.shortDescription)
        }
        return cell
    }
}
