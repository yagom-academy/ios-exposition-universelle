//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class KoreaEntriesViewController: UITableViewController {
    private var koreaEntryValues: [KoreaEntryDetail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ExpoStringEnum.koreaEntryMainTitle
        tableView.dataSource = self
        decodeKoreaEntry()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var koreaEntryData: KoreaEntryDetail?
        guard let koreaEntryDetailViewController = segue.destination as? KoreaEntryDetailViewController else {
            showAlert(alertTitle: ExpoStringEnum.failedTransferData, okTitle: ExpoStringEnum.okTitle)
            return
        }
        if segue.identifier == ExpoStringEnum.segueIdentifer {
            do {
                koreaEntryData = try transferData()
            } catch ExpoError.decodeError {
                showAlert(alertTitle: ExpoStringEnum.failedHandleData, okTitle: ExpoStringEnum.okTitle)
            } catch {
                showAlert(alertTitle: ExpoStringEnum.unexpectedError, okTitle: ExpoStringEnum.okTitle)
            }
            koreaEntryDetailViewController.koreaEntryData = koreaEntryData
        }
    }
    
    private func transferData() throws -> KoreaEntryDetail {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            throw ExpoError.indexPathError
        }
        guard let koreaEntryValue = self.koreaEntryValues?[indexPath.row] else {
            throw ExpoError.emptyValueError
        }
        let koreaEntryData: KoreaEntryDetail = koreaEntryValue
        
        return koreaEntryData
    }
    
    private func decodeKoreaEntry() {
        let assetSeeker = AssetSeeker()
        var unwrappedKoreaEntryData: [KoreaEntryDetail]?
        do {
            unwrappedKoreaEntryData = try assetSeeker.matchKoreaEntryDetailAsset()
        } catch ExpoError.decodeError {
            showAlert(alertTitle: ExpoStringEnum.failedHandleData, okTitle: ExpoStringEnum.okTitle)
        } catch {
            showAlert(alertTitle: ExpoStringEnum.unexpectedError, okTitle: ExpoStringEnum.okTitle)
        }
        koreaEntryValues = unwrappedKoreaEntryData
    }
}

extension KoreaEntriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreaEntryValues?.count ?? ExpoMagicNumberEnum.defaultRowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: KoreaEntryDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpoStringEnum.cellIdentifier) as? KoreaEntryDetailTableViewCell else {
            return KoreaEntryDetailTableViewCell()
        }
        if let koreaEntryValue = self.koreaEntryValues?[indexPath.row] {
            cell.makeCell(koreaEntryData: koreaEntryValue)
        } else {
            showAlert(alertTitle: ExpoStringEnum.failedHandleData, okTitle: ExpoStringEnum.okTitle)
        }
        
        return cell
    }
}
