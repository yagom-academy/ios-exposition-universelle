//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 윤재웅 on 2021/04/07.
//

import UIKit

class KoreaEntryViewController: UIViewController {
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
    
}
