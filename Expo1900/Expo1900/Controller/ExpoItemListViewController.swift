//
//  ExpoItemListViewController.swift
//  Expo1900
//
//  Created by Kiseok on 2023/11/01.
//

import UIKit

final class ExpoItemListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var exhibitionItems: [ExhibitionItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parsingToExhibitionItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = self
        navigationController?.isNavigationBarHidden = false
    }
    
    private func parsingToExhibitionItems() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "items") else { return }
        
        do {
            self.exhibitionItems = try jsonDecoder.decode([ExhibitionItems].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ExpoItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpoItemCell", for: indexPath) as? ExpoItemCell else { return UITableViewCell() }
        let item: ExhibitionItems = self.exhibitionItems[indexPath.row]
        cell.itemImageView.image = UIImage(named:item.imageName)
        cell.itemNameLabel.text = item.name
        cell.itemDescriptionLabel.text = item.shortDescription
        
        return cell
    }
}
