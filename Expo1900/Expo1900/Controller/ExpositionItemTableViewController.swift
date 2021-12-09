//
//  ExpositionItemTableViewController.swift
//  Expo1900
//
//  Created by 양호준 on 2021/12/09.
//

import UIKit

class ExpositionItemTableViewController: UITableViewController {
    var expositionItem: [ExpositionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        do {
            expositionItem = try JSONParser<[ExpositionItem]>.decode(fileName: "items")
        } catch {
            print(error)
        }
    }
}

// MARK: - Table view data source

extension ExpositionItemTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpositionItem", for: indexPath)
        let data = expositionItem[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: data.imageName)
        content.text = data.name
        content.secondaryText = data.shortDescription
        
        cell.contentConfiguration = content
        
        return cell
    }
}
