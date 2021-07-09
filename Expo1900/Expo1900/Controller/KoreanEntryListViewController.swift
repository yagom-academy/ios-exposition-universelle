//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by Jae-hoon Sim on 2021/07/08.
//

import UIKit

class KoreanEntryListViewController: UIViewController {

    @IBOutlet weak var entryTableView: UITableView!
    var entryList = [ExpoEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTableView.dataSource = self
        obtainEntryListData()
    }
}

//MARK:- Obtain Data
extension KoreanEntryListViewController {
    func obtainEntryListData() {
        let parsedResult = ParsingManager.shared.parse(name: "items", to: [ExpoEntry].self)
        switch parsedResult {
        case .success(let parsedData):
            entryList = parsedData
        case .failure(let parsedError):
            showAlert(error: parsedError)
        }
    }
}

//MARK:- Conform to UITableViewDataSource
extension KoreanEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KoreanEntryListCell", for: indexPath)
        let entryItem = entryList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: entryItem.imageName)
        content.text = entryItem.name
        content.secondaryText = entryItem.shortDescription
        cell.contentConfiguration = content
        return cell
    }
}
