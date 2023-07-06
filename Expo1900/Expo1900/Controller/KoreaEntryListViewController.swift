//
//  KoreaEntryListViewController.swift
//  Expo1900
//
//  Created by MARY, KOBE on 2023/06/30.
//

import UIKit

final class KoreaEntryListViewController: UIViewController {
    @IBOutlet private weak var entryListTableView: UITableView!

	private let itemsModel: [ItemsModel]? = try? Decoder.decodeJSON(dataAssetName: JSONDataNameSpace.entryData, isSnakeCase: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryListTableView.dataSource = self
		entryListTableView.delegate = self
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        
		self.title = ViewControllerTitleNameSpace.koreaEntryList
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
}

extension KoreaEntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfEntries = itemsModel?.count else {
            return 0
        }
        
        return numberOfEntries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let koreaEntryCell = tableView.dequeueReusableCell(withIdentifier: Identifier.entryListCell,
                                                                 for: indexPath) as? KoreaEntryTableViewCell,
              let itemsModel = itemsModel else {
            return UITableViewCell()
        }
		
		koreaEntryCell.configureCell(itemsModel: itemsModel[indexPath.row])
        
        return koreaEntryCell
    }
}

extension KoreaEntryListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let itemsModel = itemsModel else { return }
		
		guard let entryDetailViewController = storyboard?.instantiateViewController(identifier: Identifier.entryDetailViewController,
											  creator: { (coder) in
			return EntryDetailViewController(itemsModel: itemsModel[indexPath.row], coder: coder)
		}) else {
			return
		}
		
		self.navigationController?.pushViewController(entryDetailViewController, animated: true)
		
		tableView.deselectRow(at: indexPath, animated: false)
	}
}

extension KoreaEntryListViewController {
	private enum Identifier {
		static let entryListCell: String = "cell"
		static let entryDetailViewController: String = "EntryDetailViewController"
	}
}
