//
//  ListTableViewController.swift
//  Expo1900
//
//  Created by 신동훈 on 2021/07/10.
//

import UIKit

enum TestError: Error {
    case testError
}
class ListTableViewController: UITableViewController {

    var items: [Item] = []
    let showItemDetailSegue = "showItemDetailSegue"
    
    
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

}
