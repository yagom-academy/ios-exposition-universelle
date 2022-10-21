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
        
        self.navigationController?.isNavigationBarHidden = false
        configureExpoEntryDataFromJSON(name: "items")
    }
    
    private func configureExpoEntryDataFromJSON(name: String) {
        guard let data =  JSONDecoder().decodeData(from: name, to: expoEntries) else { return
        }
        expoEntries = data
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
