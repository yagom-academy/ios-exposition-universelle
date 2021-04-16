//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaEntryViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private let modelManager = ModelManager.shared

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        registerXib()
        self.navigationItem.title = KoreaEntryConstant.navigationTitle
        
        if modelManager.koreaEntrys.isEmpty == true {
            switch try? initKoreaEntryData() {
            case .success(let data):
                modelManager.koreaEntrys = data
            case .failure(let error):
                alterError(error)
            case .none:
                alterError(ExpoError.unknown)
            }
        }
    }
    
// MARK: - Init Setting
    
    private func registerXib() {
        let nibName = UINib(nibName: KoreaEntryConstant.cellNibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: KoreaEntryConstant.cellIdentifier)
    }
    
    private func initKoreaEntryData() throws -> Result<[StateEntry], ExpoError> {
        guard let dataAsset = NSDataAsset(name: KoreaEntryConstant.koreaEntryJson) else {
            return .failure(ExpoError.itemsData)
        }
        return .success(try JSONDecoder().decode([StateEntry].self, from: dataAsset.data))
    }
}

// MARK: - Table View

extension KoreaEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let count = modelManager.koreaEntrys.count else { return 0 }
        return modelManager.koreaEntrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KoreaEntryConstant.cellIdentifier, for: indexPath) as? KoreaEntryTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(modelManager.koreaEntrys[indexPath.row])
        return cell
    }
}

extension KoreaEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(KoreaDetailEntryViewController.initDetailEntryData(modelManager.koreaEntrys[indexPath.row]), animated: true)
    }
}

extension KoreaEntryViewController {
    enum KoreaEntryConstant {
        static let navigationTitle = "한국의 출품작"
        static let koreaEntryJson = "items"
        static let cellNibName = "KoreaEntryTableViewCell"
        static let cellIdentifier = "KoreaEntryCell"
    }
}
