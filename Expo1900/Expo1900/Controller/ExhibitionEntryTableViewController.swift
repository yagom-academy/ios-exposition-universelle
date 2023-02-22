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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
