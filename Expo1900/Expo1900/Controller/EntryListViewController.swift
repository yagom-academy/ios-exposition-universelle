//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import UIKit

final class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private(set) weak var tableView: UITableView!
    private(set) var entryList: [EntryList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        self.fetchEntryList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "한국의 출품작"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let nextViewController = segue.destination as? DescriptionViewController else { return }
        guard let cell = sender as? CustomTableViewCell else { return }
        
        cell.sendData(to: nextViewController)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryList = entryList else { return 0 }
        
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        updateCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    private func fetchEntryList() {
        guard let entryList = JSONParser.fetch(fileName: "items", parsedItems: entryList) else { return }
        
        self.entryList = entryList
    }
}
