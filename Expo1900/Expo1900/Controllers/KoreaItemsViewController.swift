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
    private let dataManager: DecodeManger = DecodeManger<KoreaItem>()
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
                popErrorAlert(error: error)
                #if DEBUG
                NSLog(error.localizedDescription)
                #endif
            } else {
                popErrorAlert(error: DataError.unknownError)
                #if DEBUG
                NSLog(DataError.unknownError.localizedDescription)
                #endif
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
    
    private func popErrorAlert(error: DataError) {
        let alert = UIAlertController(title: error.localizedDescription, message: error.failureReason, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}

extension KoreaItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(koreaItem: koreaItems[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
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
