//
//  EntryListViewController.swift
//  Expo1900
//
//  Created by unchain, bard on 2022/06/16.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var secondNavigationItem: UINavigationItem!
    let entryList = try! JsonParser.parseEntryList()
    let firstViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        secondNavigationItem.title = "한국의 출품작"
        self.navigationController?.isNavigationBarHidden = false
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.koreaEntryTitle.text = entryList[indexPath.row].name
        cell.shortDescription.text = entryList[indexPath.row].shortDescription
        cell.koreaEntryImage.image = UIImage(named: entryList[indexPath.row].imageName)
        cell.accessoryType = .disclosureIndicator
        cell.detailedDescription = entryList[indexPath.row].description
        
        return cell
    }
}
