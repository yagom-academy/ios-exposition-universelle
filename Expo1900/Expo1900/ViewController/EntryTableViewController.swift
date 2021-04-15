//
//  EntryTableViewController.swift
//  Expo1900
//
//  Created by duckbok on 2021/04/15.
//

import UIKit

class EntryTableViewController: UITableViewController {
    var koreanEntryData: [Exposition.Entry]?

    override func viewDidLoad() {
        super.viewDidLoad()
        koreanEntryData = try? JSONParser<[Exposition.Entry]>.parse("items").get()
        navigationItem.title = "한국의 출품작"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entryCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        return entryCell
    }
}
