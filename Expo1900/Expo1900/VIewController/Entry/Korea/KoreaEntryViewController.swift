//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaEntryViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var koreaEntrys: [StateEntry] = []
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        switch try? initKoreaEntryData() {
        case .success(let data):
            koreaEntrys = data
            registerXib()
            self.navigationItem.title = "한국의 출품작"
        case .failure(let error):
            alterError(error)
        case .none:
            alterError(ExpoError.unknown)
        }
    }
    
// MARK: - Init Setting
    
    private func registerXib() {
        let nibName = UINib(nibName: "KoreaEntryTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "KoreaEntryCell")
    }
    
    private func initKoreaEntryData() throws -> Result<[StateEntry], ExpoError> {
        guard let dataAsset = NSDataAsset(name: "items") else {
            return .failure(ExpoError.itemsData)
        }
        return .success(try JSONDecoder().decode([StateEntry].self, from: dataAsset.data))
    }
}

// MARK: - Table View

extension KoreaEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaEntrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KoreaEntryCell", for: indexPath) as? KoreaEntryTableViewCell else {
            return UITableViewCell()
        }
        let koreaEntry = self.koreaEntrys[indexPath.row]
        cell.setCell(koreaEntry)
        
        return cell
    }
}

extension KoreaEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(KoreaDetailEntryViewController.initDetailEntryData(self.koreaEntrys[indexPath.row]), animated: true)
    }
}
