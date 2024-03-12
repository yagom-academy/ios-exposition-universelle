//
//  EntriesTableViewController.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/8/24.
//

import UIKit

class EntriesTableViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var entryDTOs: [EntryDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeEntryItems()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func decodeEntryItems() {
        guard let entryDTOs = JSONDecoder().decode(from: "items", to: [EntryDTO].self) else {
            return
        }
        
        self.entryDTOs = entryDTOs
    }
}

extension EntriesTableViewController: UITableViewDelegate {
    
}

extension EntriesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryDTOs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entryData: Entry = entryDTOs[indexPath.row].toModel()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryTableViewCell") as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.entryImageView.image = UIImage(named: entryData.imageName)
        cell.entryNameLabel.text = entryData.name
        cell.entryShortDescriptionLabel.text = entryData.shortDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entryDetailData: EntryDetail = entryDTOs[indexPath.row].toModel()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let entryDetailViewController = storyboard.instantiateViewController(identifier: "EntryDetailViewController") { creater in
            let vc = EntryDetailViewController(coder: creater, entryDetailData: entryDetailData)
            return vc
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
