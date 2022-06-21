//
//  EntryListViewController+extension.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/21.
//

import UIKit

extension EntryListViewController {
    func updateCell(cell: CustomTableViewCell, indexPath: IndexPath) {
        updatekoreaEntryImage(of: cell, indexPath)
        updateKoreaEntryTitle(of: cell, indexPath)
        updateShortDescription(of: cell, indexPath)
        updateCellAccessoryType(of: cell)
        updateDetailedDescription(of: cell, indexPath)
    }
    
    private func updateCellAccessoryType(of cell: CustomTableViewCell) {
        cell.accessoryType = .disclosureIndicator
    }
    
    private func updateKoreaEntryTitle(of cell: CustomTableViewCell, _ indexPath: IndexPath) {
        cell.koreaEntryTitle.text = entryList?[indexPath.row].name
    }
    
    private func updatekoreaEntryImage(of cell: CustomTableViewCell, _ indexPath: IndexPath) {
        cell.koreaEntryImage.image = UIImage(named: entryList?[indexPath.row].imageName ?? "")
    }
    
    private func updateShortDescription(of cell: CustomTableViewCell, _ indexPath: IndexPath) {
        cell.shortDescription.text = entryList?[indexPath.row].shortDescription
    }
    
    private func updateDetailedDescription(of cell: CustomTableViewCell, _ indexPath: IndexPath) {
        cell.detailedDescription = entryList?[indexPath.row].description
    }
}
