//
//  KoreaEntryViewController.swift
//  Expo1900
//
//  Created by 수꿍, yeton on 2022/06/15.
//

import UIKit

final class KoreaEntryViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var koreaEntry = [Exhibits]()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        parseKoreaEntryItems()
        navigationItem.title = "한국의 출품작"
    }
}

extension KoreaEntryViewController {
    // MARK: - UI
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == NameSpace.transferToDetailsVCId.name else {
            return
        }
        guard let index = tableView.indexPathForSelectedRow?.row else {
            return
        }
            
        let destination = segue.destination as? KoreaEntryDetailsViewController
      
        let exhibit = koreaEntry[index]
        
        destination?.exhibit = exhibit
    }
}

extension KoreaEntryViewController {
    // MARK: - Parsing
    
    private func parseKoreaEntryItems() {
        guard let parsedItems = JSONData.parse(
            name: NameSpace.expoEntryData.name,
            to: koreaEntry) else {
            return
        }
        
        koreaEntry = parsedItems
    }
}

extension KoreaEntryViewController: UITableViewDataSource {
    // MARK: - TableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreaEntry.count
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
