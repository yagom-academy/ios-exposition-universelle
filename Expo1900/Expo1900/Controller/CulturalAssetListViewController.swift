//
//  CulturalAssetListViewController.swift
//  Expo1900
//
//  Created by Charles on 2023/11/02.
//

import UIKit

class CulturalAssetListViewController: UITableViewController {
    var culturalAssets:[CulturalAsset] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeDataAsset()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return culturalAssets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: culturalAssets[indexPath.row].imageName)
        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        content.imageProperties.reservedLayoutSize = CGSize(width: 65, height: 0)
        
        content.text = culturalAssets[indexPath.row].name
        content.secondaryText = culturalAssets[indexPath.row].shortDescription
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    func decodeDataAsset() {
        let decoder = JSONDecoder()

        guard let dataAsset = NSDataAsset(name: "items") else {
            return
        }

        do {
            culturalAssets = try decoder.decode([CulturalAsset].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
