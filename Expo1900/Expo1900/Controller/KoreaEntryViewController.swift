//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/15.
//

import UIKit

class KoreaEntryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var koreaEntry = [Exhibits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        parseKoreaEntryItems()
        NavigationBarFormatter.setTitle(navigationItem, title: "한국의 출품작")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "transferToDetailsVC" else {
            return
        }
        guard let index = self.tableView.indexPathForSelectedRow?.row else {
            return
        }
            
        let destination = segue.destination as? KoreaEntryDetailsViewController
      
        destination?.deliveredImageName = koreaEntry[index].imageName
        destination?.deliveredDescription = koreaEntry[index].description
        destination?.deliveredTitle = koreaEntry[index].name
    }
    
    private func parseKoreaEntryItems() {
        guard let parsedItems = JSONData.parse(name: "items", to: koreaEntry) else {
            return
        }
        
        koreaEntry = parsedItems
    }
}

extension KoreaEntryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = koreaEntry[indexPath.row].name
        content.secondaryText = koreaEntry[indexPath.row].shortDescription
        content.image = UIImage(named: koreaEntry[indexPath.row].imageName)
        content.imageProperties.maximumSize.width = 50
        content.imageProperties.maximumSize.height = 50
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
