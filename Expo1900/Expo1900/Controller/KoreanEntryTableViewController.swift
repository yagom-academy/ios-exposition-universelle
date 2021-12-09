//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class KoreanEntryTableViewController: UITableViewController {
    private var dataSource: EntryDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = EntryDataSource()
        tableView.dataSource = dataSource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToEntryDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEntryDetail",
           let destination = segue.destination as? EntryDetailViewController,
           let sender = sender as? IndexPath {
            guard let entries = JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry) else {
                fatalError()
            }
            let entry = entries[sender.row]
            destination.entry = entry
        }
    }
}
