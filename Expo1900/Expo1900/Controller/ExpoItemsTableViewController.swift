//
//  ExpoItemsTableViewController.swift
//  Expo1900
//
//  Created by Aladdin on 2021/12/10.
//

import UIKit

class ExpoItemsTableViewController: UIViewController {
    
    @IBOutlet weak var expoItemTableView: UITableView!
    
    let expoItemsJSONFile = "items"
    var expoItems: ExpoItems = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupExpoItemsTableView()
        expoItemTableView.dataSource = self
    }
    
    private func setupExpoItemsTableView() {
        expoItems = decodeExpoMainInformationJsonData()
    }
    
    private func decodeExpoMainInformationJsonData() -> ExpoItems {
        var expoItemArray: ExpoItems = []
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try convertToNSDataAsset(from: expoItemsJSONFile)
            expoItemArray = try jsonDecoder.decode(ExpoItems.self, from: jsonData.data)
        } catch JSONDataError.fileConversionFailed(let fileName) {
            print(JSONDataError.fileConversionFailed(fileName).description)
        } catch {
            print(error.localizedDescription)
        }
        return expoItemArray
    }
    
    private func convertToNSDataAsset(from fileName: String) throws -> NSDataAsset  {
        guard let jsonData = NSDataAsset(name: fileName) else {
            throw JSONDataError.fileConversionFailed(fileName)
        }
        return jsonData
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ExpoItemDetailViewController,
           let indexPath = expoItemTableView.indexPathForSelectedRow {
            let expoItem = expoItems[indexPath.row]
            destination.expoItem = expoItem
            expoItemTableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

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
