//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by Minsup, Jusbug on 2023/06/28.
//

import UIKit

final class KoreanEntryListViewController: UIViewController {
    @IBOutlet weak private var entryTableView: UITableView!
    private let entryList: [Entry] = DecodingHelper.decode(file: .entry) ?? []
    static let identifier = "koreanEntryListViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXib()
        self.configureNavigation()
        self.entryTableView.delegate = self
        self.entryTableView.dataSource = self        
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: EntryListCell.nibName, bundle: nil)
        entryTableView.register(nibName, forCellReuseIdentifier: EntryListCell.reuseIdentifier)
    }
}

extension KoreanEntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = self.entryList[indexPath.row]
        
        guard let entryDetailViewController = self.storyboard?.instantiateViewController(
            identifier: EntryDetailViewController.identifier,
            creator: { EntryDetailViewController(entry: entry, coder: $0)}
        ) else { return }
        
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
        
        entryTableView.deselectRow(at: indexPath, animated: false)
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
        cell.configureLabelFont()
        cell.configureDynamicType()
        cell.configureAccessibilityLable()
        
        return cell
    }
}
