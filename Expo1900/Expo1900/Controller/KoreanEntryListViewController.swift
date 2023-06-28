//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/06/28.
//

import UIKit

class KoreanEntryListViewController: UIViewController {
    @IBOutlet weak private var entryTableView: UITableView!
    private var entryList: [Entry] = DecodingHandler.decode(fileName: .entry) ?? []
    static let identifier = "koreanEntryListViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXib()
        self.entryTableView.delegate = self
        self.entryTableView.dataSource = self
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: EntryListCell.nibName, bundle: nil)
        entryTableView.register(nibName, forCellReuseIdentifier: EntryListCell.reuseIdentifier)
    }
}

extension KoreanEntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: EntryDetailViewController.identifier) as? EntryDetailViewController else { return }
        
        entryDetailViewController.entry = self.entryList[indexPath.row]
        
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}

extension KoreanEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryListCell.reuseIdentifier) as? EntryListCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(entry: self.entryList[indexPath.row])
        
        return cell
    }
}
