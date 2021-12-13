//
//  KoreanEntryTableViewController.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class KoreanEntryTableViewController: UITableViewController, AlertDelegate {
    static let goToEntryDetail = "goToEntryDetail"
    private var dataSource: EntryDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = EntryDataSource()
        tableView.dataSource = dataSource
        dataSource?.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Self.goToEntryDetail, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.goToEntryDetail,
           let destination = segue.destination as? EntryDetailViewController,
           let sender = sender as? IndexPath {
            guard let entries = JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry) else {
                showAlert(alertMessage: .jsonDecodingFailed, buttonMessage: .confirm)
                return
            }
            let entry = entries[sender.row]
            destination.entry = entry
        }
    }
}
