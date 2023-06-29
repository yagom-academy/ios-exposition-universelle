//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

final class EntryListViewController: UIViewController {
    private var entryList: [Entry]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeEntryList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "한국의 출품작"
    }
    
    private func decodeEntryList() {
        let dataAssetName = "items"
        
        do {
            entryList = try Decoder.decodeJSON(dataAssetName)
        } catch {
            print(error)
        }
    }
}

//MARK: UITableViewDataSource
extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "entryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        guard let entryCell = cell as? EntryTableViewCell else {
            return cell
        }
        
        if let entryList {
            entryCell.configureCell(with: entryList[indexPath.row])
        }
        
        return entryCell
    }
}

//MARK: UITableViewDelegate
extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboardName = "Main"
        let storyboardId = "EntryDetailViewController"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)
        
        guard let entryDetailViewController = viewController as? EntryDetailViewController else {
            return
        }
        
        if let entryList {
            entryDetailViewController.entryName = entryList[indexPath.row].name
            entryDetailViewController.entryImageName = entryList[indexPath.row].imageName
            entryDetailViewController.descriptionText = entryList[indexPath.row].description
        }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
