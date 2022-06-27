//
//  EntryListViewController+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

extension EntryListViewController {
    func setUI() {
        self.setDelgates()
        self.setNavigation()
    }

    func updateCell(cell: EntryListCell,
                    _ indexPath: IndexPath) {
        self.updatekoreaEntryImage(of: cell,
                                   indexPath)
        self.updateKoreaEntryTitle(of: cell,
                                   indexPath)
        self.updateShortDescription(of: cell,
                                    indexPath)
        self.updateCellAccessoryType(of: cell)
    }
    
    private func setDelgates() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    private func setNavigation() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func updatekoreaEntryImage(of cell: EntryListCell,
                                       _ indexPath: IndexPath) {
        cell.koreaEntryImage.image = UIImage(named: entryList?[indexPath.row].imageName ?? ExpoNameSpace.empty.name)
    }

    private func updateKoreaEntryTitle(of cell: EntryListCell,
                                       _ indexPath: IndexPath) {
        cell.koreaEntryTitle.text = entryList?[indexPath.row].name
    }

    private func updateShortDescription(of cell: EntryListCell,
                                        _ indexPath: IndexPath) {
        cell.shortDescription.text = entryList?[indexPath.row].shortDescription
    }

    private func updateCellAccessoryType(of cell: EntryListCell) {
        cell.accessoryType = .disclosureIndicator
    }
}
