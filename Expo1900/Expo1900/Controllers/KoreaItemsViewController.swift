//
//  KoreaItemsController.swift
//  Expo1900
//
//  Created by tottalE, Kyo on 10/17/22.
//

import UIKit

final class KoreaItemsViewController: UIViewController {

    private let cellIdentifier = "itemCell"
    
    @IBOutlet private weak var koreanItemsTable: UITableView!
    private let dataManager: DataManager = DataManager<KoreaItem>()
    private var koreaItems: [KoreaItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setNavigationBar()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setData() {
        do {
            koreaItems = try dataManager.fetchDataList(name: AssetName.koreaItemJSON)
        } catch {
            if let error = error as? DataError {
                print(error.message)
            } else {
                print(DataError.unknownError.message)
            }
        }
    }
    
    private func setTableView() {
        koreanItemsTable.delegate = self
        koreanItemsTable.dataSource = self
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        self.title = Constant.koreaItemsNavigationTitle
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(koreaItem: koreaItems[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension KoreaItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            let errorCell = UITableViewCell()
            errorCell.textLabel?.text = "Error"
            return errorCell
        }
        
        var content = cell.defaultContentConfiguration()
        
        content.text = koreaItems[indexPath.row].name
        content.textProperties.font = UIFont.systemFont(ofSize: 30)
        
        content.secondaryText = koreaItems[indexPath.row].shortDescription
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 15)
        
        content.image = UIImage(named: koreaItems[indexPath.row].imageName)
        content.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        content.imageProperties.reservedLayoutSize = CGSize(width: 80, height: 80)
        content.imageToTextPadding = CGFloat(10)
        
        cell.contentConfiguration = content

        return cell
    }
}
