//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class KoreanEntryTableViewController: UITableViewController, AlertDelegate {
    static let segueToEntryDetail = "goToEntryDetail"
    private let dataSource = EntryDataSource(entries: JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry) ?? [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        dataSource.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Self.segueToEntryDetail, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.segueToEntryDetail,
           let destination = segue.destination as? EntryDetailViewController,
           let sender = sender as? IndexPath {
            destination.entry = dataSource.entries[sender.row]
        }
    }
}
