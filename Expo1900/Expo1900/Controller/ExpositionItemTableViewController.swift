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
}
