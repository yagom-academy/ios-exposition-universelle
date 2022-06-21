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
    private(set) var cellIdentifier = ExpoNameSpace.cellIdentifier.name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        self.fetchEntryList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = ExpoNameSpace.koreaEntry.name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell else { return }
        let storyboard = UIStoryboard(name: ExpoNameSpace.descriptionIdentifier.name, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ExpoNameSpace.descriptionIdentifier.name) as? DescriptionViewController else { return }
        
        cell.sendData(to: viewController)
        viewController.entryList = entryList?[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryList = entryList else { return 0 }
        
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        updateCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    private func fetchEntryList() {
        guard let entryList = JSONParser.fetch(fileName: ExpoNameSpace.koreaEntryJSONFileName.name, parsedItems: entryList) else { return }
        
        self.entryList = entryList
    }
}
