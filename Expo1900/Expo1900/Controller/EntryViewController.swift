//
//  ExpoEntryViewController.swift
//  Expo1900
//
//  Created by yyss99, kyungmin on 2023/07/02.
//

import UIKit

class EntryViewController: UIViewController {

    var expoEntries: [ExpoEntry] = [ExpoEntry]()
    @IBOutlet weak var entryTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "한국의 출품작"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryTableView.dataSource = self
        entryTableView.delegate = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            expoEntries = try jsonDecoder.decode([ExpoEntry].self, from: dataAsset.data)
        } catch {
            print("오류")
        }
        
    }
}

extension EntryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expoEntry = expoEntries[indexPath.row]
        
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EntryTableViewCell else {
            return UITableViewCell()
        }
        entryCell.configureView(expoEntry: expoEntry)
        
        return entryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let expoEntry = self.expoEntries[indexPath.row]
    
        guard let entryDetailViewController = storyboard?.instantiateViewController(withIdentifier: "entryDetailViewController") as? EntryDetailViewController else { return }
        
        entryDetailViewController.entryImage = UIImage(named: expoEntry.imageName)
        entryDetailViewController.entryDetailDescription = expoEntry.entryDescription
        entryDetailViewController.entryName = expoEntry.name
        
        navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
