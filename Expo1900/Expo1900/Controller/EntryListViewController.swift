//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var entryList: [EntryList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigationController?.isNavigationBarHidden = false
        fetchEntryList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "한국의 출품작"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let nextViewController: DescriptionViewController = segue.destination as? DescriptionViewController else { return }
        guard let cell: CustomTableViewCell = sender as? CustomTableViewCell else { return }
        
        nextViewController.imageToSet = cell.koreaEntryImage
        nextViewController.textToSet = cell.detailedDescription
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entryList = entryList else { return 0 }
        
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        updateCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func fetchEntryList() {
        guard let entryList = JSONParser.fetch(fileName: "items", parsedItems: entryList) else { return }
        
        self.entryList = entryList
    }
}
