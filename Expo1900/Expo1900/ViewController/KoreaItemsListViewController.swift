//
//  KoreanItemsListViewController.swift
//  Expo1900
//
//  Created by 이영우 on 2021/04/12.
//

import UIKit

final class KoreaItemsListViewController: UIViewController {
    @IBOutlet private weak var koreaItemsListTableView: UITableView!
    private var itemsData: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = KoreaItemsListConstant.title
        decodeData()
        setKoreaListTableViewCell()
        self.koreaItemsListTableView.delegate = self
        self.koreaItemsListTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func decodeData() {
        let decoder: JSONDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: KoreaItemsListConstant.itemsJson, bundle: .main) else {
            return
        }
        do {
            itemsData = try decoder.decode([Item].self, from: dataAsset.data)
        } catch {
            implementErrorAlert(ExpoError.invalidItemData)
        }
    }
    
    private func setKoreaListTableViewCell() {
        let koreaItemTableViewCell = UINib(nibName: String(describing: KoreanEntryTableViewCell.self), bundle: nil)
        self.koreaItemsListTableView.register(koreaItemTableViewCell, forCellReuseIdentifier: KoreaItemsListConstant.koreaItemsListCell)
    }
}

extension KoreaItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let itemInfoViewController = storyboard.instantiateViewController(identifier: KoreaItemsListConstant.itemInfoPageIdentifier) as? ItemInfoViewController else {
            return
        }
        
        itemInfoViewController.paramItem = self.itemsData[indexPath.row]
        self.navigationController?.pushViewController(itemInfoViewController, animated: true)
    }
}

extension KoreaItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = koreaItemsListTableView.dequeueReusableCell(withIdentifier: KoreaItemsListConstant.koreaItemsListCell, for: indexPath) as? KoreanEntryTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.set(itemsData[indexPath.row])
        return cell
    }
}

extension KoreaItemsListViewController {
    enum KoreaItemsListConstant {
        static let title = "한국의 출품작"
        static let itemsJson = "items"
        static let koreaItemsListCell = "koreaItemListTableViewCell"
        static let itemInfoPageIdentifier = "itemInfoVC"
    }
}
