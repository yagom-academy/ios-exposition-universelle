//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by Dasan & Moon on 2023/06/27.
//

import UIKit

class EntryListViewController: UIViewController {
    private var entryList: [Entry]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeIntroduction()
    }
    
    private func decodeIntroduction() {
        let decoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else {
            return
        }
        
        do {
            entryList = try decoder.decode([Entry].self, from: dataAsset.data)
        } catch {
            print(error)
        }
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        guard let entryCell = cell as? EntryTableViewCell else {
            return cell
        }
        
        if let entryList {
            entryCell.titleLabel.text = entryList[indexPath.row].name
            entryCell.shortDescriptionLabel.text = entryList[indexPath.row].shortDescription
            entryCell.entryImageView.image = UIImage(named: entryList[indexPath.row].imageName)
        }
        
        return cell
    }
}
