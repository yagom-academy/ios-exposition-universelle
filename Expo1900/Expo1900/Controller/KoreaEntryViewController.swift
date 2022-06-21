//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/15.
//

import UIKit

final class KoreaEntryViewController: UIViewController {
    private var koreaEntry = [Exhibits]()
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        parseKoreaEntryItems()
        self.navigationItem.setTitle(NameSpace.koreaEntry.name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == NameSpace.transferToDetailsVCId.name else {
            return
        }
        guard let index = self.tableView.indexPathForSelectedRow?.row else {
            return
        }
            
        let destination = segue.destination as? KoreaEntryDetailsViewController
      
        let exhibit = koreaEntry[index]
        
        destination?.exhibit = exhibit
    }
    
    private func parseKoreaEntryItems() {
        guard let parsedItems = JSONData.parse(
            name: NameSpace.expoEntryData.name,
            to: koreaEntry) else {
            return
        }
        
        self.koreaEntry = parsedItems
    }
}

extension KoreaEntryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.koreaEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameSpace.entryCellId.name, for: indexPath)
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
