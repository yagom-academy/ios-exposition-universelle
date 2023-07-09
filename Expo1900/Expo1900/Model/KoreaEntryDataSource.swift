//
//  KoreaEntryDataSource.swift
//  Expo1900
//
//  Created by Zion, Serena on 2023/06/29.
//

import UIKit

final class KoreaEntryDataSource: NSObject, UITableViewDataSource {
    private var koreaEntryList: [ExpositionItem]?
    
    init(koreaEntyList: [ExpositionItem]?) {
        self.koreaEntryList = koreaEntyList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreaEntryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreaEntryTableViewCell.reuseIdentifier, for: indexPath) as? KoreaEntryTableViewCell else { return UITableViewCell() }
        guard let entryItem = koreaEntryList?[indexPath.row] else { return UITableViewCell() }
        
        cell.configure(with: entryItem)
        return cell
    }
}
