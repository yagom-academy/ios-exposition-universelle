//
//  KoreaItemsController.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//

import UIKit

class KoreaItemsViewController: UIViewController {

    @IBOutlet weak var koreanItemsTable: UITableView!
    let dataManager: DataManager = DataManager()
    var koreaItems: [KoreaItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setData() {
        do {
            koreaItems = try dataManager.fetchKoreaItemData()
        } catch {
            if let error = error as? DataError {
                print(error.message)
            } else {
                print(DataError.unknownError.message)
            }
        }
    }
    
    func setTableView() {
        koreanItemsTable.delegate = self
        koreanItemsTable.dataSource = self
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    
}

extension KoreaItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cellIdentifier) else {
            let errorCell = UITableViewCell()
            errorCell.textLabel?.text = "Error"
            return errorCell
        }
        cell.textLabel?.text = koreaItems[indexPath.row].name
        cell.detailTextLabel?.text = koreaItems[indexPath.row].shortDescription
        cell.imageView?.image = UIImage(named: koreaItems[indexPath.row].imageName)
        return cell
    }
}
