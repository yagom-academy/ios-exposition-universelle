//
//  ItemsViewController.swift
//  Expo1900
//
//  Created by 이승재 on 2021/12/09.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var itemsTableView: UITableView!
    
    var items: [ItemInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        itemsTableView.dataSource = self
        setItems()
    }
    
    private func setTitle() {
        self.title = "한국의 출품작"
    }
    
    private func setItems() {
        do {
            self.items = try Parser.parsedItemsInfo()
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
