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
        self.navigationItem.title = "한국의 출품작"
        tableView.dataSource = self
        decodeKoreaEntry()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var koreaEntryData: KoreaEntryDetail?
        guard let koreaEntryDetailViewController = segue.destination as? KoreaEntryDetailViewController else {
            showAlert(alertTitle: "데이터 전송에 실패했습니다.", okTitle: "OK")
            return
        }
        if segue.identifier == segueIdentifer {
            do {
                koreaEntryData = try transferData()
            } catch ExpoError.decodeError {
                showAlert(alertTitle: "데이터 처리가 실패했습니다", okTitle: "OK")
            } catch {
                showAlert(alertTitle: "예상치 못한 에러 발생!", okTitle: "OK")
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
            showAlert(alertTitle: "데이터 처리가 실패했습니다", okTitle: "OK")
        } catch {
            showAlert(alertTitle: "예상치 못한 에러 발생!", okTitle: "OK")
        }
        koreaEntryValues = unwrappedKoreaEntryData
    }
}

extension KoreaEntriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreaEntryValues?.count ?? ExpoEnum.defaultRowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: KoreaEntryDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "KoreaEntryDetailTableViewCell") as? KoreaEntryDetailTableViewCell else {
            return KoreaEntryDetailTableViewCell()
        }
        if let koreaEntryValue = self.koreaEntryValues?[indexPath.row] {
            cell.makeCell(koreaEntryData: koreaEntryValue)
        } else {
            showAlert(alertTitle: "데이터 처리에 실패했습니다. 데이터를 다시 한번 확인해주세요.", okTitle: "OK")
        }
        
        return cell
    }
}
