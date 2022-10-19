//
//  KoreanItemViewController.swift
//  Expo1900
//
//  Created by 유연수 on 2022/10/19.
//

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
    
}

extension KoreanItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
// TODO: - customCell 구현 후 작성
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
}
