//
//  EntryDataSource.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

protocol AlertDelegate: UIViewController {
    func showAlert(alertMessage: AlertMessage, buttonMessage: AlertMessage)
}

class EntryDataSource: NSObject, UITableViewDataSource {
    static let entryCell = "entryCell"
    weak var delegate: AlertDelegate?
    let entries = JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KoreanEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.entryCell, for: indexPath) as? EntryTableViewCell,
              let entries = entries else {
                  delegate?.showAlert(alertMessage: .loadingTableViewCellFailed, buttonMessage: .confirm)
                  return UITableViewCell()
        }
        let entry = entries[indexPath.row]
        cell.setCustomCellComponents(image: entry.imageName, title: entry.name, shortDescription: entry.shortDesc)

        return cell
    }
}
