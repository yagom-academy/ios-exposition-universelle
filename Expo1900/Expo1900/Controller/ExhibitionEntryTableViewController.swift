//
//  ExhibitionTableViewController.swift
//  Expo1900
//
//  Created by Harry, 레옹아범 on 2023/02/22.
//

import UIKit

class ExhibitionEntryTableViewController: UITableViewController {

    var exhibitionItem: [ExhibitionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ExhibitionEntryCell.self, forCellReuseIdentifier: ExhibitionEntryCell.identifier)
        
        configureNavigationBar()
        decodeJson()
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "한국의 출품작"
    }
    
    private func decodeJson() {
        let jsonDecoder = JSONDecoder()
        guard let data = NSDataAsset(name: "items") else { return }
        
        do {
            exhibitionItem = try jsonDecoder.decode([ExhibitionItem].self, from: data.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Table view data source
extension ExhibitionEntryTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitionItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitionEntryCell.identifier, for: indexPath) as? ExhibitionEntryCell else {
            return UITableViewCell()
        }
        
        let data = exhibitionItem[indexPath.row]
        
        cell.exhibitionImage.image = data.image
        cell.titleLabel.text = data.name
        cell.contentLabel.text = data.shortDescription
        
        return cell
    }
}
