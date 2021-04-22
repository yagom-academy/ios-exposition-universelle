//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaEntryViewController: UIViewController, JsonDecoding {
    @IBOutlet private weak var tableView: UITableView!
    
    private var koreaEntrys: [StateEntry] = []

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        registerXib()
        self.navigationItem.title = Constant.navigationTitle
        
        do {
            let result: Result<[StateEntry], ExpoError> = try jsonDecode(assetName: Constant.koreaEntryJson)
            switch result {
            case .success(let data):
                koreaEntrys = data
            case .failure(let error):
                alterError(error)
            }
        } catch {
            alterError(ExpoError.itemsData)
        }
    }
    
// MARK: - Init Setting
    
    private func registerXib() {
        let nibName = UINib(nibName: Constant.cellNibName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: Constant.cellIdentifier)
    }
}

// MARK: - Table View

extension KoreaEntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let count = modelManager.koreaEntrys.count else { return 0 }
        return koreaEntrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath) as? KoreaEntryTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(koreaEntrys[indexPath.row])
        return cell
    }
}

extension KoreaEntryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(KoreaDetailEntryViewController.initDetailEntryData(koreaEntrys[indexPath.row]), animated: true)
    }
}

extension KoreaEntryViewController {
    enum Constant {
        static let navigationTitle = "한국의 출품작"
        static let koreaEntryJson = "items"
        static let cellNibName = "KoreaEntryTableViewCell"
        static let cellIdentifier = "KoreaEntryCell"
    }
}
