//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by 김동욱 on 2022/04/15.
//

import UIKit

enum EntryListLetter {
    static let koreaEntryList = "한국의 출품작"
    static let entryCell = "EntryCell"
}

final class EntryListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let expositionItems = [ExpositionItems].parse(JsonFile.items)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.backButtonTitle = EntryListLetter.koreaEntryList
    }
}

extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = expositionItems?[indexPath.row]
        guard let entryItemViewController = EntryItemViewController.instance(item: item) else {
            return
        }
        self.navigationController?.pushViewController(entryItemViewController, animated: false)
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EntryCell = tableView.dequeueReusableCell(withIdentifier: EntryListLetter.entryCell, for: indexPath) as? EntryCell ?? EntryCell()
        let item = expositionItems?[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}
