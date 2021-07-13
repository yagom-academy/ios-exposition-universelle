//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by Marco, Soll, Yescoach. on 2021/07/13.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDataSource {
    // MARK: @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    let cellIdentifier = "EntryCell"
    let entryDataIdentifier = "items"
    var entries = [Entry]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
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
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
