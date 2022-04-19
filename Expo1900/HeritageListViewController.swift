//
//  HeritageListViewController.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/15.
//

import UIKit

class HeritageListViewController: UIViewController, GenerateErrorAlertProtocol {

    @IBOutlet private var heritageListTableView: UITableView!
    private var items: [Item] = []
    static let heritageListViewControllerName = String(describing: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - UITableViewDataSource method
extension HeritageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: HeritageListCell.self)

        guard let cell = heritageListTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? HeritageListCell else {
            return UITableViewCell()
        }
        
        guard let item = items[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.setContentOfCell(item)

        return cell
    }
}

// MARK: - UITableViewDelegate method
extension HeritageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = String(describing: DetailViewController.self)

        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: identifier) as? DetailViewController else {
            return
        }
        
        detailViewController.item = items[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - logic method
extension HeritageListViewController {
    private func loadItems() -> [Item]? {
        let jsonManager: JsonManagerable = JsonManager()
        do {
            let heritageInfo: [Item] = try jsonManager.decodedResult()
            return heritageInfo
        } catch {
            let alertController = makeUIAlertControllerFromError(error)
            present(alertController, animated: true, completion: nil)
            return nil
        }
    }
    
    private func setInitialSetting() {
        items = loadItems() ?? []
        navigationController?.navigationBar.topItem?.title = "메인"
        title = "한국의 출품작"
        heritageListTableView.dataSource = self
        heritageListTableView.delegate = self
    }
}

