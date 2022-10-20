//
//  EntryViewController.swift
//  Expo1900
//
//  Created by Wonbi on 2022/10/20.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet weak var entryTableView: UITableView!
    let cellIdetifier: String = "entryCell"
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let entries = JSONDecoder.decode([Entry].self, from: "items") else { return }
        
        entryTableView.delegate = self
        entryTableView.dataSource = self
        
        navigationController?.navigationBar.isHidden = false
        title = "한국의 출품작"
        
        self.entries = entries
    }
}

extension EntryViewController: UITableViewDelegate {
    
}

extension EntryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
