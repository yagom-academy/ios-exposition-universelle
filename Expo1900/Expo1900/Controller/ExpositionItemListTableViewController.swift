//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionItemListTableViewController: UIViewController {
    private let expositionItemManager = ExpositionItemManager()
    private var expositionItems: [ExpositionItem] = []
    private static let expositionItemCellIdentifier = "expositionItemCell"
    
    @IBOutlet private var expositionItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expositionItemTableView.dataSource = self
        expositionItemTableView.delegate = self
        
        do {
            expositionItems = try expositionItemManager.decodejsonData()
        } catch let error as JsonDataFetchError {
            let alert = UIAlertController(title: error.description.title, message: error.description.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction.ActionType.ok.action())
            self.present(alert, animated: true, completion: nil)
        } catch {
            
        }
    }
}

// MARK:- UITableViewDataSource
extension ExpositionItemListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpositionItemListTableViewController.expositionItemCellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: expositionItems[indexPath.row].imageName)
        content.text = expositionItems[indexPath.row].name
        content.secondaryText = expositionItems[indexPath.row].shortDescription
        content.imageProperties.maximumSize = CGSize(width: 70, height: 150)
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK:- UITableViewDelegate
extension ExpositionItemListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(identifier: ExpositionItemDetailViewController.identifier) as? ExpositionItemDetailViewController else {
            return
        }
        
        detailViewController.configure(expositionItems[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
