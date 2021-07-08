//
//  ItemListViewController.swift
//  Expo1900
//
//  Created by yun on 2021/07/08.
//

import UIKit

class ItemListViewController: UIViewController {

    var itemList: [KoreanItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }
        do {
        itemList = try jsonDecoder.decode([KoreanItem].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

    }
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListCell", for: indexPath) else {
            <#statements#>
        }
    }
}
