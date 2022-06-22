//
//  EntryListViewController+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/22.
//

import UIKit

extension EntryListViewController {
    func updateUI() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigationController?.isNavigationBarHidden = false
    }

    func updateCell(cell: CustomTableViewCell, _ indexPath: IndexPath) {
        updatekoreaEntryImage(of: cell, indexPath)
        updateKoreaEntryTitle(of: cell, indexPath)
        updateShortDescription(of: cell, indexPath)
        updateCellAccessoryType(of: cell)
    }

    private func updatekoreaEntryImage(of cell: CustomTableViewCell,  _ indexPath: IndexPath) {
        cell.koreaEntryImage.image = UIImage(named: entryList?[indexPath.row].imageName ?? ExpoNameSpace.empty.name)
    }

    private func updateKoreaEntryTitle(of cell: CustomTableViewCell,  _ indexPath: IndexPath) {
        cell.koreaEntryTitle.text = entryList?[indexPath.row].name
    }

    private func updateShortDescription(of cell: CustomTableViewCell,  _ indexPath: IndexPath) {
        cell.shortDescription.text = entryList?[indexPath.row].shortDescription
    }

    private func updateCellAccessoryType(of cell: CustomTableViewCell) {
        cell.accessoryType = .disclosureIndicator
    }
}
