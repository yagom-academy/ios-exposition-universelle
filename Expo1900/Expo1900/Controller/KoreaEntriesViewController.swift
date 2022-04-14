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
        let koreaEntryData: KoreaEntryDetail = self.koreaEntryDataArray[indexPath.row]
        
        cell.koreaEntryImageView.image = UIImage(named: koreaEntryData.imageFileName)
        cell.titleLabel.text = koreaEntryData.name
        cell.shortDescriptionLabel.text = koreaEntryData.shortDescription
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}
