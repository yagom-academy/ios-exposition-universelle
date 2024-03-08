//
//  EntryViewController.swift
//  Expo1900
//
//  Created by Yejin Hong on 3/8/24.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var entryDTOArray: [EntryDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeEntryItems()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func decodeEntryItems() {
        guard let entryDTOArray = JSONDecoder().decode(from: "items", to: [EntryDTO].self) else {
            return
        }
        
        self.entryDTOArray = entryDTOArray
    }
}

extension EntryViewController: UITableViewDelegate {
    
}

extension EntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryDTOArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entryData: Entry = entryDTOArray[indexPath.row].toModel()
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryTableViewCell") as? EntryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.entryImageView.image = UIImage(named: entryData.imageName)
        cell.entryNameLabel.text = entryData.name
        cell.entryShortDescriptionLabel.text = entryData.shortDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entryDetailData: EntryDetail = entryDTOArray[indexPath.row].toModel()
        
        guard let entryDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "EntryDetailViewController") as? EntryDetailViewController else {
            return
        }
        
        entryDetailViewController.entryDetailData = entryDetailData
        
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
}
