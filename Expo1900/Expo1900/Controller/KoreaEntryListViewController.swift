//
//  KoreaEntryListViewController.swift
//  Expo1900
//
//  Created by MARY on 2023/06/30.
//

import UIKit

final class KoreaEntryListViewController: UIViewController {
    @IBOutlet weak var entryListTableView: UITableView!

	private let itemsModel: [ItemsModel]? = try? Decoder.decodeJSON(dataAssetName: JSONDataNameSpace.entryData)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryListTableView.dataSource = self
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.title = ViewControllerTitleNameSpace.koreaEntryList
		let backBarButtonItem = UIBarButtonItem(title: ViewControllerTitleNameSpace.koreaEntryList, style: .plain, target: self, action: nil)
		navigationItem.backBarButtonItem = backBarButtonItem
		navigationController?.setNavigationBarHidden(false, animated: false)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let destination = segue.destination as? EntryDetailViewController,
			  let selectedIndex = self.entryListTableView.indexPathForSelectedRow?.row else {
			return
		}
		
		guard let itemsModel = itemsModel else { return }
		
		destination.koreanEntryImage = UIImage(named: itemsModel[selectedIndex].imageName)
		destination.entryDescription = itemsModel[selectedIndex].desc
		destination.entryTitle = itemsModel[selectedIndex].name
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
		guard let koreaEntryCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.entryListCell, for: indexPath) as? KoreaEntryTableViewCell else {
            return UITableViewCell()
        }
		
		guard let itemsModel = itemsModel else {
			return UITableViewCell()
		}
		
		koreaEntryCell.entryImageView.image = UIImage(named: itemsModel[indexPath.row].imageName)
        koreaEntryCell.titleLabel.text = itemsModel[indexPath.row].name
        koreaEntryCell.shortDescLabel.text = itemsModel[indexPath.row].shortDesc
        
        return koreaEntryCell
    }
}

extension KoreaEntryListViewController {
	private enum CellIdentifier {
		static let entryListCell: String = "cell"
	}
}
