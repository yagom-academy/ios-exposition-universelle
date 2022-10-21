//
//  ExpoEntriesViewController.swift
//  Expo1900
//
//  Created by junho lee on 2022/10/20.
//

import UIKit

final class ExpoEntriesViewController: UIViewController {
    
    @IBOutlet private weak var ExpoEntriesTableView: UITableView!
    
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

extension ExpoEntriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = ExpoEntriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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

extension ExpoEntriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entryViewController: EntryViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryViewController") as? EntryViewController  else { return }
        entryViewController.sendExpoEntry(expoEntries[indexPath.row])
        self.navigationController?.pushViewController(entryViewController, animated: true)
    }
}
