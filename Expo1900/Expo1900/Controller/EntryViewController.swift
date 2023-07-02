//
//  ExpoEntryViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

class EntryViewController: UIViewController {

    var expoEntrys: [ExpoEntry] = [ExpoEntry]()
    @IBOutlet weak var entryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryTableView.dataSource = self
        entryTableView.delegate = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expoEntrys = try jsonDecoder.decode([ExpoEntry].self, from: dataAsset.data)
        } catch {
            print("오류")
        }
        
    }
}

extension EntryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expoEntry = expoEntrys[indexPath.row]
        
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        entryCell.configureView(expoEntry: expoEntry)
        
        return entryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController = storyboard?.instantiateViewController(withIdentifier: "entryDetailViewController") as? EntryDetailViewController else { return }
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
