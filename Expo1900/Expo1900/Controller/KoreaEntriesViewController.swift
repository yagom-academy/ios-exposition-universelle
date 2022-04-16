//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class KoreaEntriesViewController: UITableViewController {
    var koreaEntryDataArray: [KoreaEntryDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
        tableView.dataSource = self
        decodeKoreaEntry()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let koreaEntryDetailViewController = segue.destination as? KoreaEntryDetailViewController else { return }
        if segue.identifier == "KoreaEntryDetailViewController" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let koreaEntryData: KoreaEntryDetail = self.koreaEntryDataArray[indexPath.row]
                 koreaEntryDetailViewController.koreaEntryData = koreaEntryData
            }
        }
    }
    
    func decodeKoreaEntry() {
        guard let unwrappedKoreaEntryData = Parser<[KoreaEntryDetail]>.parse(name: "items") else {
            return
        }
        koreaEntryDataArray = unwrappedKoreaEntryData
    }
}

extension KoreaEntriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreaEntryDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: KoreaEntryDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KoreaEntryDetailTableViewCell") as? KoreaEntryDetailTableViewCell else {
            return KoreaEntryDetailTableViewCell()
        }
        cell.makeCell(koreaEntryData: koreaEntryDataArray[indexPath.row])
        return cell
    }
}
