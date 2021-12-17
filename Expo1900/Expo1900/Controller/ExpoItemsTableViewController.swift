//
//  ExpoItemsTableViewController.swift
//  Expo1900
//
//  Created by Aladdin on 2021/12/10.
//

import UIKit

final class ExpoItemsTableViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var expoItemTableView: UITableView!
    
    var expoItems: ExpoItems = []
    
    // MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpoItems()
        setUpExpoItemTableView()
        setUpNavigationBarItem()
    }
    
    // MARK: - UIElement SetUp Methods
    private func setUpExpoItemTableView() {
        expoItemTableView.dataSource = self
    }
    
    private func setUpNavigationBarItem() {
        navigationItem.title = NavigationTitle.itemsListView
        let backBarButtonItem = UIBarButtonItem(title: NavigationTitle.itemsListView, style: .plain, target: self, action: nil)
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        backBarButtonItem.setTitleTextAttributes(attribute, for: .normal)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setExpoItems() {
        expoItems = decodeExpoItemsJsonData()
    }
    
    // MARK: - Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ExpoItemDetailViewController,
              let indexPath = expoItemTableView.indexPathForSelectedRow else {
                  return
              }
        let expoItem = expoItems[indexPath.row]
        destination.expoItem = expoItem
        expoItemTableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - JSONData Methods
    private func decodeExpoItemsJsonData() -> ExpoItems {
        var expoItemArray: ExpoItems = []
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try convertToNSDataAsset(from: JSONFile.expoItems)
            expoItemArray = try jsonDecoder.decode(ExpoItems.self, from: jsonData.data)
        } catch JSONDataError.fileNotFound(let fileName) {
            print(JSONDataError.fileNotFound(fileName).description)
        } catch {
            print(error.localizedDescription)
        }
        return expoItemArray
    }
    
    private func convertToNSDataAsset(from fileName: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw JSONDataError.fileNotFound(fileName)
        }
        return jsonData
    }

}

// MARK: - UITableViewDataSource
extension ExpoItemsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expoItemCell", for: indexPath) as! ExpoItemTableViewCell
        let expoItem = expoItems[indexPath.row]
        cell.configure(with: expoItem)
        return cell
    }
}
