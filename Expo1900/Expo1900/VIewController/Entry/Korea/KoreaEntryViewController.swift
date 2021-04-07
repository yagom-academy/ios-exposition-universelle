//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

final class KoreaEntryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var koreaEntrys: [StateEntry] = []
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        do {
            try initKoreaEntryData()
            registerXib()
        } catch {
            alterError(error)
        }
    }
    
// MARK: - Init Setting
    
    private func registerXib() {
        let nibName = UINib(nibName: "KoreaEntryTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "KoreaEntryCell")
    }
    
    private func initKoreaEntryData() throws {
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: KoreaEntryVariable.koreaEntryJson) else {
            throw ExpoError.itemsData
        }
        self.koreaEntrys = try JSONDecoder().decode([StateEntry].self, from: dataAsset.data)
        self.navigationItem.title = KoreaEntryVariable.navigationTitle
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
        let koreaDetailEntryViewController = KoreaDetailEntryViewController()
        koreaDetailEntryViewController.detailEntry = self.koreaEntrys[indexPath.row]
        self.navigationController?.pushViewController(koreaDetailEntryViewController, animated: true)
    }
}
