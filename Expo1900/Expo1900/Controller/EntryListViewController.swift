//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach. on 2021/07/13.
//

import UIKit

class EntryListViewController: UIViewController {
    
    // MARK: @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private let cellIdentifier = "EntryCell"
    private let entryDataIdentifier = "items"
    
    private var entries = [Entry]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: entryDataIdentifier) else {
            return
        }
        do {
            self.entries = try jsonDecoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? EntryDetailViewController else {
            return
        }
        guard let cell = sender as? CustomTableViewCell else {
            return
        }
        guard let index = tableView.indexPath(for: cell)?.row else {
            return
        }
        
        nextViewController.entryTitle = entries[index].name
        nextViewController.entryImageName = entries[index].imageName
        nextViewController.entryDescription = entries[index].description
    }
}

extension EntryListViewController: UITableViewDataSource {
    // MARK: TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: self.cellIdentifier,
            for: indexPath
        ) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let entry = self.entries[indexPath.row]
        cell.entryImageView.image = UIImage(named: entry.imageName ?? "")
        cell.entryTitleLabel.text = entry.name
        cell.entryDetailLabel.text = entry.shortDescription
        
        return cell
    }
}
