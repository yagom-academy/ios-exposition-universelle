//
//  EntryWorkViewController.swift
//  Expo1900
//
//  Created by 배은서 on 2021/04/10.
//

import UIKit

final class EntryWorkViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var entryWorks: [EntryWorkItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadJsonData()
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func loadJsonData() {
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset.init(name: "items") else { return }
        
        do {
            entryWorks = try decoder.decode([EntryWorkItem].self, from: dataAsset.data)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension EntryWorkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryWorkTableViewCell", for: indexPath) as? EntryWorkTableViewCell else { return UITableViewCell() }
        
        cell.updateCell(entryWorks[indexPath.row])
        
        return cell
    }
}

extension EntryWorkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryWorkDetailViewController = self.storyboard?.instantiateViewController(identifier: "entryWorkDetailVC") as? EntryWorkDetailViewController else { return }
        
        entryWorkDetailViewController.entryWorkItem = entryWorks[indexPath.row]
        self.navigationController?.pushViewController(entryWorkDetailViewController, animated: false)
    }
}
