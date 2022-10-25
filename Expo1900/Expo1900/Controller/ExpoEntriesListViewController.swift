//
//  ExpoEntriesListViewController.swift
//  Expo1900
//
//  Created by Jeremy, 준호 on 2022/10/20.
//

import UIKit

final class ExpoEntriesListViewController: UIViewController {
    
    @IBOutlet private weak var expoEntriesListTableView: UITableView!
    private var manager: ExpoEntriesManager = ExpoEntriesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.configureExpoEntriesFromJSON()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ExpoEntriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.entriesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExpoEntryCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ExpoEntryCell,
              let expoEntry = manager.expoEntries?[indexPath.row] else { return ExpoEntryCell() }
        let image: UIImage? = manager.expoEntryImage(index: indexPath.row)
        cell.configureContentsView(image: image,
                                   name: expoEntry.name,
                                   shortDescription: expoEntry.shortDescription)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ExpoEntriesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let expoEntry = manager.expoEntries?[indexPath.row] else { return }
        let expoEntryData: ExpoEntryData = (manager.expoEntryImage(index: indexPath.row),
                                            expoEntry.name,
                                            expoEntry.description)
        guard let entryDetailViewController: EntryDetailViewController = self.storyboard?.instantiateViewController(identifier: "EntryDetailViewController", creator: { (coder) -> EntryDetailViewController? in
            return EntryDetailViewController(coder: coder, expoEntryData: expoEntryData)
        }) as? EntryDetailViewController else { return }
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
