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
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerXib()
        do {
            try initKoreaEntryData()
        } catch {
            alterError(error)
        }
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "KoreaEntryTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "KoreaEntryCell")
    }
    
    private func initKoreaEntryData() throws {
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: "items") else {
            throw ExpoError.expoData
        }
        self.koreaEntrys = try JSONDecoder().decode([StateEntry].self, from: dataAsset.data)
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func alterError(_ error: Error) {
        let message = error.localizedDescription
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        alert.present(self, animated: true)
    }
}

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
