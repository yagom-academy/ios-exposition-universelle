//
//  KoreaEntryDataSource.swift
//  Expo1900
//
//  Created by Hyun A Song on 2023/06/29.
//

import UIKit

final class KoreaEntryDataSource: NSObject, UITableViewDataSource {
    var cellIdentifier: String
    private var koreaEntryList: [ExhibitionItem]?
    
    init(_ cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        koreaEntryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else { return UITableViewCell() }
        
        cell.textLabel?.text = "TEST"
        cell.detailTextLabel?.text = "WERWERW"
        
        return cell
    }
}

// MARK: - Load Inforamtion
extension KoreaEntryDataSource {
    func loadKoreaEntryInformation() {
        let jsonDecoder = JSONDecoder()
        guard let asset = NSDataAsset(name: "items") else { return }
        
        do {
            let data = try jsonDecoder.decode([ExhibitionItem].self, from: asset.data)
            koreaEntryList = data
        } catch {
            print(error.localizedDescription)
        }
    }
}
