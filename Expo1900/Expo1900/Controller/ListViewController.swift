//
//  ListViewController.swift
//  Expo1900
//
//  Created by Doogie, Red on 2022/04/14.
//

import UIKit

final class ListViewController: UIViewController {
    @IBOutlet weak private var listTableView: UITableView!
    
    private var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        navigationItem.title = "한국의 출품작"
        
        storeItem(item: Heritage.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIViewController.attemptRotationToDeviceOrientation()
    }
    //MARK: - functions
    private func storeItem(item: Item.Type) {
        do {
            items = try item.getItems()
        } catch let error {
            showAlert(for: "경고", message: "데이터 로드 오류 \n" + error.localizedDescription)
        }
    }
}
//MARK: - about tableview
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath)
        guard let itemCell = cell as? ItemTableViewCell else { return cell }
        guard let item = items[safe: indexPath.row] else { return cell }
        itemCell.displayWith(item: item)
        itemCell.changeItemStackViewSetting()
        
        return itemCell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = items[safe: indexPath.row] else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let itemVC = storyboard
            .instantiateViewController(identifier: ItemViewController.identifier,
                                       creator: { coder -> ItemViewController? in
                return .init(coder, item)
            })
        
        navigationController?.pushViewController(itemVC, animated: true)
    }
}
