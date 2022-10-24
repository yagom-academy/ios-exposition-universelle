//
//  ExpoEntriesListViewController.swift
//  Expo1900
//
//  Created by junho lee on 2022/10/20.
//

import UIKit

final class ExpoEntriesListViewController: UIViewController {
    
    @IBOutlet private weak var expoEntriesListTableView: UITableView!
    
    private var expoEntriesManager: ExpoEntriesManager = ExpoEntriesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expoEntriesManager.configureExpoEntriesFromJSON()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ExpoEntriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntriesManager.entriesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExpoEntryCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ExpoEntryCell,
              let expoEntry = expoEntriesManager.expoEntries?[indexPath.row] else { return ExpoEntryCell() }
        let image: UIImage? = expoEntriesManager.expoEntryImage(index: indexPath.row)
        cell.configureContentsView(image: image, name: expoEntry.name, shortDescription: expoEntry.shortDescription)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ExpoEntriesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController: EntryDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryViewController") as? EntryDetailViewController,
              let expoEntry = expoEntriesManager.expoEntries?[indexPath.row] else { return }
        entryDetailViewController.sendExpoEntry(expoEntry)
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
