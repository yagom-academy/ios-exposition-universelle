//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by Jae-hoon Sim on 2021/07/08.
//

import UIKit

class KoreanEntryListViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak private var entryTableView: UITableView!
    
    //MARK: Properties
    private var entryItems = [ExpoEntry]()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTableView.dataSource = self
        obtainEntryItemsData()
    }
}

//MARK:- Obtain Data
extension KoreanEntryListViewController {
    private func obtainEntryItemsData() {
        let expoEntryItemsFileName = "items"
        let parsedResult = ParsingManager.shared.parse(name: expoEntryItemsFileName, to: [ExpoEntry].self)
        
        switch parsedResult {
        case .success(let entryItemsContents):
            entryItems = entryItemsContents
        case .failure(let parsingError):
            showAlert(error: parsingError)
        }
    }
}

//MARK:- Send Data
extension KoreanEntryListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showDetailSegueIdentifier = "ShowEntryDetailSegue"
        
        guard let indexPath = entryTableView.indexPathForSelectedRow,
              segue.identifier == showDetailSegueIdentifier,
              let detailViewController = segue.destination as? EntryDetailViewController else {
            return showAlert(error: DataTransferError.sendingError)
        }
        detailViewController.configure(with: entryItems[indexPath.row])
    }
}

//MARK:- Conform to UITableViewDataSource
extension KoreanEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entryItemCellIdentifier = "KoreanEntryItemCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: entryItemCellIdentifier, for: indexPath)
        let entryItem = entryItems[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: entryItem.imageName)
        content.text = entryItem.name
        content.secondaryText = entryItem.shortDescription
        cell.contentConfiguration = content
        
        return cell
    }
}
