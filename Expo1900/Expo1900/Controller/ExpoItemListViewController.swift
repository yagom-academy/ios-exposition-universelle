//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by 세홍, 송준, 무리 on 2023/02/22.
//

import UIKit

final class ExpoItemListViewController: UIViewController {
    
    @IBOutlet weak private var listTableView: UITableView!
    
    var decodedExpoItem: ExpoItemDecoder = ExpoItemDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodedExpoItem.decodeData()
        listTableView.reloadData()
        listTableView.dataSource = self
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationController?
            .navigationBar
            .topItem?
            .backBarButtonItem = UIBarButtonItem(title: "메인",
                                                 style: .plain,
                                                 target: self,
                                                 action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let itemDetailViewController: ItemDetailViewController = segue.destination as? ItemDetailViewController,
              let cell: ListTableViewCell = sender as? ListTableViewCell else { return }
    
        itemDetailViewController.receiveData(from: cell)
    }
}

extension ExpoItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodedExpoItem.expoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.configureCellData(expoItem: decodedExpoItem.expoItems[indexPath.row])
        
        return cell
    }
}
