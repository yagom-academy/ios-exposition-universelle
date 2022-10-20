//
//  ExpoEntriesViewController.swift
//  Expo1900
//
//  Created by junho lee on 2022/10/20.
//

import UIKit

final class ExpoEntriesViewController: UIViewController {
    
    @IBOutlet private weak var ExpoEntryTableView: UITableView!
    
    var expoEntries: [ExpoEntry] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureExpoEntryDataFromJSON(name: "items")
    }
    
    private func configureExpoEntryDataFromJSON(name: String) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: name) else { return }
        
        do {
            self.expoEntries = try jsonDecoder.decode([ExpoEntry].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
}

extension ExpoEntriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expoEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = ExpoEntryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureExpoEntryContents(of: cell, with: expoEntries[indexPath.row])
        return cell
    }
    
    private func configureExpoEntryContents(of cell: UITableViewCell, with expoEntry: ExpoEntry) {
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
        let vc: EntryViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryViewController") as! EntryViewController
        vc.send(data: expoEntries[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
