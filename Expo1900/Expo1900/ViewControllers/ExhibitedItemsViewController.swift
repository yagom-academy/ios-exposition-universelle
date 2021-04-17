//
//  ExhibiedItemsViewController.swift
//  Expo1900
//
//  Created by seunkim on 2021/04/09.
//

import UIKit

class ExhibitedItemsViewController: UIViewController {
    
    var items: [ExhibitedItem] = []
    
    @IBOutlet weak var exhibitedItemsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exhibitedItemsTable.delegate = self
        exhibitedItemsTable.dataSource = self
        
        let nibName = UINib(nibName: "ExhibiedItemTableViewCell", bundle: nil)
        exhibitedItemsTable.register(nibName, forCellReuseIdentifier: "itemCell")
        self.navigationItem.title = KoreanLetter.koreanEntries
        parseExhibitedItems()
    }
    
    private func parseExhibitedItems() {
        let jsonDecoder = JSONDecoder()
        guard let itemJsonData = NSDataAsset(name: "items") else { return }
        guard let items = try? jsonDecoder.decode([ExhibitedItem].self, from: itemJsonData.data) else { return }
        self.items = items
    }
}

extension ExhibitedItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "itemDetail") as? ItemDetailViewController else { return }
        itemDetailViewController.exhibitedItem = items[indexPath.row]
        exhibitedItemsTable.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
}

extension ExhibitedItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ExhibiedItemTableViewCell
        cell.titleLabel.text = items[indexPath.row].name
        cell.photoImageView.image = UIImage(named: items[indexPath.row].imageName)
        cell.shortDescriptionLabel.text = items[indexPath.row].shortDescription
        return cell
    }
}
