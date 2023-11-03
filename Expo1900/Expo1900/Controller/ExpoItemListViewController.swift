//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by Kiseok, Toy on 2023/11/01.
//

import UIKit

final class ExpoItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var exhibitionItems: [ExhibitionItem] = []
    var exhibitionItemsData = DataDecoder<[ExhibitionItem]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        do {
            exhibitionItems = try exhibitionItemsData.parse(assetName: "items")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let itemDescriptionViewController = segue.destination as? ItemDescriptionViewController else { return }
        let cellIndexPath = tableView.indexPathForSelectedRow
        guard let rowOfIndexPath: Int = cellIndexPath?.row else { return }
        
        itemDescriptionViewController.navigationItem.title = exhibitionItems[rowOfIndexPath].name
        itemDescriptionViewController.itemImage = exhibitionItems[rowOfIndexPath].imageName
        itemDescriptionViewController.itemDescription = exhibitionItems[rowOfIndexPath].description
    }
}

extension ExpoItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpoItemCell", for: indexPath) as? ExpoItemCell else {
            return UITableViewCell()
        }
        let item: ExhibitionItem = self.exhibitionItems[indexPath.row]
        
        cell.itemImageView.image = UIImage(named:item.imageName)
        cell.itemNameLabel.text = item.name
        cell.itemDescriptionLabel.text = item.shortDescription
        
        return cell
    }
}
