//
//  ExpoEntriesListViewController.swift
//  Expo1900
//
//  Created by junho lee on 2022/10/20.
//

import UIKit

final class ExpoEntriesListViewController: UIViewController {
    
    @IBOutlet private weak var expoEntriesListTableView: UITableView!
    
    var expoEntries: [ExpoEntry] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        configureExpoEntriesFromJSON(name: "items")
    }
    
    private func configureExpoEntriesFromJSON(name: String) {
        guard let expoEntries =  JSONDecoder().decode(from: name, to: expoEntries) else { return }
        self.expoEntries = expoEntries
    }
}

extension ExpoEntriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = expoEntriesListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureExpoEntry(of: cell, with: expoEntries[indexPath.row])
        return cell
    }
    
    private func configureExpoEntry(of cell: UITableViewCell, with expoEntry: ExpoEntry) {
        cell.imageView?.image = UIImage(named: expoEntry.imageName)
        cell.textLabel?.text = expoEntry.name
        cell.detailTextLabel?.text = expoEntry.shortDescription
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension ExpoEntriesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryDetailViewController: EntryDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryViewController") as? EntryDetailViewController  else { return }
        entryDetailViewController.sendExpoEntry(expoEntries[indexPath.row])
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
