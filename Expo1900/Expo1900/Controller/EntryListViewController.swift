//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/17.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let entryList: [EntryList] = {
        var entryList: [EntryList] = [EntryList]()
        do {
            entryList = try JsonParser.parseEntryList()
        } catch {
            print(ParseError.unknown.description)
        }
        return entryList
    }()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "한국의 출품작"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        UITableViewCell()
    }
}
