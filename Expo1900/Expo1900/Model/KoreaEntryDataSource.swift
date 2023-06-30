//
//  KoreaEntryDataSource.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/29.
//

import UIKit

final class KoreaEntryDataSource: NSObject, UITableViewDataSource {
    private var koreaEntryList: [ExpositionItem]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreaEntryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.basicCellIdentifier, for: indexPath)
        guard let koreaEntryItem = koreaEntryList?[indexPath.row] else { return UITableViewCell() }
        
        cell.setExpositionEntryCell(information: koreaEntryItem)
        return cell
    }
}

// MARK: - Load Information
extension KoreaEntryDataSource {
    func loadKoreaEntryInformation() {
        guard let data: [ExpositionItem] = Decoder.decode(fileName: "items") else { return }
        
        koreaEntryList = data
    }
}

// MARK: - Send Information
extension KoreaEntryDataSource {
    func sendEntryInformation(index: Int) -> ExpositionItem? {
        guard let information = koreaEntryList?[index] else { return nil }
        
        return information
    }
}
